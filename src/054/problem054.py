# -*- coding: utf-8 -*-
"""Poker hands

In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:

- High Card: Highest value card.
- One Pair: Two cards of the same value.
- Two Pairs: Two different pairs.
- Three of a Kind: Three cards of the same value.
- Straight: All cards are consecutive values.
- Flush: All cards of the same suit.
- Full House: Three of a kind and a pair.
- Four of a Kind: Four cards of the same value.
- Straight Flush: All cards are consecutive values of same suit.
- Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:

    2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next highest cards are compared, and so on.

Consider the following five hands dealt to two players:

| Hand |    Player 1    |    Player 2    |  Winner  |
| ---- | -------------- | -------------- | -------- |
|   1  | 5H 5C 6S 7S KD | 2C 3S 8S 8D TD | Player 2 |
|   2  | 5D 8C 9S JS AC | 2C 5C 7D 8S QH | Player 1 |
|   3  | 2D 9C AS AH AC | 3D 6D 7D TD QD | Player 2 |
|   4  | 4D 6S 9H QH QC | 3D 6D 7H QD QS | Player 1 |
|   5  | 2H 2D 4C 4D 4S | 3C 3D 3S 9S 9D | Player 1 |

The file, [poker.txt](https://projecteuler.net/project/resources/p054_poker.txt), contains one-thousand random hands dealt to two players. Each line of the file contains ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?
"""

CARD_RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
CARD_SUITS = ['D', 'S', 'H', 'C']


class Card:
    def __init__(self, value, suit):
        self.rank = value
        self.suit = suit

    def __repr__(self):
        return str(self.rank) + str(self.suit)

    def __gt__(self, Card):
        return CARD_RANKS.index(self.rank) > CARD_RANKS.index(Card.rank)

    def __ge__(self, Card):
        return CARD_RANKS.index(self.rank) >= CARD_RANKS.index(Card.rank)

    def __lt__(self, Card):
        return CARD_RANKS.index(self.rank) < CARD_RANKS.index(Card.rank)

    def __le__(self, Card):
        return CARD_RANKS.index(self.rank) <= CARD_RANKS.index(Card.rank)

    def __eq__(self, Card):
        return CARD_RANKS.index(self.rank) == CARD_RANKS.index(Card.rank)

    def __ne__(self, Card):
        return CARD_RANKS.index(self.rank) != CARD_RANKS.index(Card.rank)

    def __add__(self, Card):
        return CARD_RANKS.index(self.rank) + CARD_RANKS.index(Card.rank)

    def __sub__(self, Card):
        return CARD_RANKS.index(self.rank) - CARD_RANKS.index(Card.rank)


FULL_DECK = [Card(value,suit) for suit in CARD_SUITS for value in CARD_RANKS]


class Player:
    def __init__(self, pot):
        self.hand = []
        self.pot = pot


def getSameSuit(suit, cards):
    suited = []
    for c in cards:
        if c.suit == suit:
            suited.append(c)
    return suited


def getSameRank(rank, cards):
    sameRankCards = []
    for c in cards:
        if c.rank == rank:
            sameRankCards.append(c)
    return sameRankCards


def getHighCard(cards):
    high = cards[0]
    for c in cards:
        if c > high:
            high = c
    return high


def order(cards):
    tempCards = list(cards)
    ordered = []
    while tempCards:
        high = getHighCard(tempCards)
        tempCards.remove(high)
        ordered.append(high)
    return ordered


def countSameRank(card, cards):
    return len(getSameRank(card.rank, cards))


def countSameSuit(card, cards):
    return len(getSameSuit(card.suit, cards))


###############################################################################


def getPairs(cards):
    pairs = []
    for card in cards:
        if countSameRank(card, cards) == 2:
            pairs.append(card)
    return order(pairs)


def getThreeOfAKind(cards):
    trips = []
    for card in cards:
        if countSameRank(card, cards) == 3:
            trips.append(card)
    return order(trips)


def getStraight(cards):
    ordered = order(cards)

    for c in cards:
        if c == Card('A', ''):
            ordered.append(c)

    diff = [i-j for i, j in zip(ordered[:-1], ordered[1:])]

    dupes = 0
    count = 0
    start = -1
    for i in range(len(diff)):
        if diff[i] == 1 or diff[i] == -12:
            count += 1
            if count == 4:
                start = i-3-dupes
                end = i+2
        elif diff[i] == 0:
            dupes += 1
        else:
            count = 0
            dupes = 0

    if start == -1:
        return []
    else:
        return ordered[start:end]


def getFlush(cards):
    for suit in CARD_SUITS:
        suited = getSameSuit(suit, cards)
        if len(suited) >= 5:
            return order(suited)
    return []


def getFullHouse(cards):
    return getThreeOfAKind(cards) + getPairs(cards)


def getFourOfAKind(cards):
    quads = []
    for card in cards:
        if countSameRank(card, cards) == 4:
            quads.append(card)
    return quads


def getStraightFlush(cards):
    for suit in CARD_SUITS:
        suited = getSameSuit(suit, cards)
        if hasStraight(suited):
            return getStraight(suited)
    return []


def getRoyalStraightFlush(cards):
    if hasRoyalStraightFlush(cards):
        return getStraightFlush(cards)
    else:
        return []


###############################################################################


def hasPair(cards):
    return len(getPairs(cards)) > 0


def hasTwoPairs(cards):
    return len(getPairs(cards)) > 2


def hasThreeOfAKind(cards):
    return len(getThreeOfAKind(cards)) > 0


def hasFourOfAKind(cards):
    return len(getFourOfAKind(cards)) > 0


def hasFullHouse(cards): #FIXME
    return (hasThreeOfAKind(cards) and hasPair(cards)) or \
        (len(getThreeOfAKind(cards)) > 3)


def hasFlush(cards):
    return len(getFlush(cards)) > 0


def hasStraight(cards):
    return len(getStraight(cards)) > 0


def hasStraightFlush(cards):
    return len(getStraightFlush(cards)) > 0


def hasRoyalStraightFlush(cards):
    for suit in CARD_SUITS:
        suited = getSameSuit(suit, cards)
        if sameOrHigherCount(Card('T',''), suited) >= 5:
            return True
    return False


###############################################################################


def getProbability(occurences, total):
    if occurences == 0:
        return '  0.000%'
    return '{:8.3%} (1 in {:.1f})'.format(occurences/total, total/occurences)


def sameOrHigherCount(card, cards):
    count = 0
    for c in cards:
        if c >= card:
            count += 1
    return count


def getHandCode(cards):
    code = 0

    if hasRoyalStraightFlush(cards):
        code = 9
    elif hasStraightFlush(cards):
        code = 8
    elif hasFourOfAKind(cards):
        code = 7
    elif hasFullHouse(cards):
        code = 6
    elif hasFlush(cards):
        code = 5
    elif hasStraight(cards):
        code = 4
    elif hasThreeOfAKind(cards):
        code = 3
    elif hasTwoPairs(cards):
        code = 2
    elif hasPair(cards):
        code = 1

    return code << 5*4


def getKickersValue(cards):
    if hasRoyalStraightFlush(cards):
        return 0

    elif hasStraightFlush(cards):
        return CARD_RANKS.index(getStraightFlush(cards)[0].rank) << 4*4

    elif hasFourOfAKind(cards):
        ordCards = order(cards)
        value = CARD_RANKS.index(getFourOfAKind(cards)[0].rank) << 4*4
        for card in getFourOfAKind(cards):
            ordCards.remove(card)
        return value + (CARD_RANKS.index(ordCards[0].rank) << 3*4)

    elif hasFullHouse(cards):
        return (CARD_RANKS.index(getFullHouse(cards)[0].rank) << 4*4) + (CARD_RANKS.index(getFullHouse(cards)[3].rank) << 3*4)

    elif hasFlush(cards):
        return (CARD_RANKS.index(getFlush(cards)[0].rank) << 4*4) + \
            (CARD_RANKS.index(getFlush(cards)[1].rank) << 3*4) + \
            (CARD_RANKS.index(getFlush(cards)[2].rank) << 2*4) + \
            (CARD_RANKS.index(getFlush(cards)[3].rank) << 1*4) + \
            CARD_RANKS.index(getFlush(cards)[4].rank)

    elif hasStraight(cards):
        return CARD_RANKS.index(getStraight(cards)[0].rank) << 4*4

    elif hasThreeOfAKind(cards):
        ordCards = order(cards)
        value = CARD_RANKS.index(getThreeOfAKind(cards)[0].rank) << 4*4
        for card in getThreeOfAKind(cards):
            ordCards.remove(card)
        if len(ordCards) > 0:
            value += (CARD_RANKS.index(ordCards[0].rank) << 3*4)
        if len(ordCards) > 1:
            value += (CARD_RANKS.index(ordCards[1].rank) << 2*4)
        return value

    elif hasTwoPairs(cards):
        ordCards = order(cards)
        value = (CARD_RANKS.index(getPairs(cards)[0].rank) << 4*4) + (CARD_RANKS.index(getPairs(cards)[2].rank) << 3*4)
        for card in getPairs(cards)[:4]:
            ordCards.remove(card)
        if len(ordCards) > 0:
            value += (CARD_RANKS.index(ordCards[0].rank) << 2*4)
        return value

    elif hasPair(cards):
        ordCards = order(cards)
        value = CARD_RANKS.index(getPairs(cards)[0].rank) << 4*4
        for card in getPairs(cards):
            ordCards.remove(card)
        if len(ordCards) > 0:
            value += (CARD_RANKS.index(ordCards[0].rank) << 3*4)
        if len(ordCards) > 1:
            value += (CARD_RANKS.index(ordCards[1].rank) << 2*4)
        if len(ordCards) > 2:
            value += (CARD_RANKS.index(ordCards[2].rank) << 1*4)
        if len(ordCards) > 3:
            value += CARD_RANKS.index(ordCards[3].rank)
        return value

    else:
        ordCards = order(cards)
        value = (CARD_RANKS.index(ordCards[0].rank) << 4*4)
        if len(ordCards) > 1:
            value += (CARD_RANKS.index(ordCards[1].rank) << 3*4)
        if len(ordCards) > 2:
            value += (CARD_RANKS.index(ordCards[2].rank) << 2*4)
        if len(ordCards) > 3:
            value += (CARD_RANKS.index(ordCards[3].rank) << 1*4)
        if len(ordCards) > 4:
            value += CARD_RANKS.index(ordCards[4].rank)
        return value


def getHandScore(cards):
    return getHandCode(cards) + getKickersValue(cards)


def parseAndDecideWinner(line):
    cards = line.split(' ')
    hand1 = [Card(c[0], c[1]) for c in cards[:5]]
    hand2 = [Card(c[0], c[1]) for c in cards[5:]]
    if getHandScore(hand1) > getHandScore(hand2):
        return 1
    else:
        return 2


if __name__ == '__main__':
    poker_file = open('p054_poker.txt', 'r')
    result = [parseAndDecideWinner(line) for line in poker_file].count(1)
    print(result)
