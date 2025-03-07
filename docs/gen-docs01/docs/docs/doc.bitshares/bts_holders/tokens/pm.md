# Prediction Markets {#pm}

A prediction market is a specialized BitAsset such that total debt and
total collateral are always equal amounts (although asset IDs differ).
No margin calls or force settlements may be performed on a prediction
market asset. A prediction market is globally settled by the issuer
after the event being predicted resolves, thus a prediction market must
always have the [global_settle]{.title-ref} permission enabled. The
maximum price for global settlement or short sale of a prediction market
asset is 1-to-1.

::: {.contents local=""}
Table of Contents
:::

> [!NOTE]
> In the following, we denote a *positive outcome* as a predication
> market that resolves to [true]{.title-ref} (i.e. a price feed of
> [1]{.title-ref}) and a *negative outcome* to resolve to
> [false]{.title-ref} (i.e., a price feed of [0]{.title-ref})

If the bet resolves to [true]{.title-ref} (i.e. a price feed of
[1]{.title-ref}), then the PM-asset can be settled release the
collateral to the holder of the asset.

If, instead, the bet resolves to [false]{.title-ref} (i.e. a price feed
of [0]{.title-ref}), then those that sold the PM-asset on the market and
went short, made a profit since it PM-asset became worthless.

## Creation

Prediction markets are assets that trade freely and can be borrowed from
the market at a 1:1 ratio with the backing asset (which could be any
other asset, including BTS, USD, GOLD).

## Betting

A user can take either bet on a positive outcome, or a negative outcome.
We here show how this works, technically.

### Betting for a Positive Outcome

If you are confident that the bet will resolve positive, you want to
**hold** that particular PM-asset since it allows you to settle it for
it\'s collateral on a 1:1 basis.

In order to get hold of those tokens, you can put a buy order for them
at any price (between 0 and 1) and wait for it to be filled, or buy at
market rates. By this technique, a user can pre define at which odds to
buy shares.

For instance, if you think that the bet resolves positively at a
probability of [80%]{.title-ref}, you can put your buy order at a price
of [0.8]{.title-ref}. If the bet resolves positively (price feed of
[1]{.title-ref}), then you can settle your shares at [1]{.title-ref} and
make a 20% profit.

If you can buy tokens at a price of [0.2]{.title-ref} (i.e. market
participants think it is unlikely to resolve positively), then you could
make [80%]{.title-ref} profits at a risk of loosing with
[80%]{.title-ref} probability.

After closing of the bet, a user can claim his profits by **settling**
his borrow position and taking out the collateral:

- **Settlement in the CLI wallet**: :

      >>> settle_asset <account> <amount> <symbol> True

- **Borrowing in the GUI wallet**: A settlement button is available when
  hovering the asset in your account\'s overview.

### Betting for a Negative Outcome

In order to bet for a negative outcome (bet resolves to
[false]{.title-ref} with a price feed of [0]{.title-ref}), you need to
**sell** the tokens. In order to get them, you should **not** buy them
at the market, but instead **borrow** them from the network by paying
collateral at a 1:1 ratio.

For example, in the [PM.PRESIDENT2016]{.title-ref} if you want to bet on
a negative outcome with [100k BTS]{.title-ref}, you can borrow [100k
PM.PRESIDENT2016]{.title-ref} by paying [100k BTS]{.title-ref} to the
network.

> [!NOTE]
> Since PM-Assets can technically be pegged by any other asset, you may
> need to pay USD (or anything else) instead of BTS.

Once you borrowed the token, you can sell them at any price between
[0]{.title-ref} and [1]{.title-ref}. If you thing the probability of a
negative outcome is [20%]{.title-ref}, you should consider selling your
tokens at [0.2]{.title-ref}.

If the bet resolves negatively (price feed of [0]{.title-ref}), your
debts is worth [debt = amount \* price = 0 BTS]{.title-ref}, you can
reclaim your collateral at zero cost, and get to keep [20%]{.title-ref}
profits from selling the token at [0.2]{.title-ref}. If instead the bet
resolves positively and you sold all tokens, you cannot close your
borrow position to redeem your collateral. However, your total loss is
reduced by [20%]{.title-ref} for selling the tokens at the market.

If, by the end of the bet, you still have some of the tokens left, you
can of course close your borrow position partly and redeem the
corresponding percentage of the collateral.

- **Borrowing in the CLI wallet**: :

      >>> borrow_asset <account> <amount> <PMsymbol> <1:1-amount> true

- **Borrowing in the GUI wallet**: Of course, the asset can also be
  borrowed in the **GUI/web wallet** by using the [Borrow x]{.title-ref}
  button in the market.

  ![Borrow PM-Asset](pm-borrow-btn.png){.align-center width="400px"}

## Resolving

A price feed needs to be published for the prediction market by the
issuer or feed producer. It is essentially a global settlement which
will set the parameters of the asset such that the holders of the asset
can settle at the outcome of the bet (0, or 1). The details are shown in
the guide pm-close-manual (ref: *docs.bitshares.dev* material)
