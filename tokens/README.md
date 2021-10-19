# TOKENOMICS

### PERI TOKEN INFORMATION&#x20;

```
// The number of PERI rewarded to the caller of Pynthetix.mint()uint 
public minterReward = 200 * SafeDecimalMath.unit();

// The initial weekly inflationary supply is 75m / 52 until the start of the decay rate.
// 75e6 * SafeDecimalMath.unit() / 52
uint public constant INITIAL_WEEKLY_SUPPLY = 47058823529411764705882;

// Address of the PynthetixProxy for the onlyPynthetix modifier
address payable public pynthetixProxy;

// Max PERI rewards for minter
uint public constant MAX_MINTER_REWARD = 200 * 1e18;

// How long each inflation period is before mint can be called
uint public constant MINT_PERIOD_DURATION = 1 weeks;

uint public constant INFLATION_START_DATE = 1614988800; // 2021-03-06T00:00:00+00:00
uint public constant MINT_BUFFER = 1 days;
uint8 public constant SUPPLY_DECAY_START = 52; // Week 52
uint8 public constant SUPPLY_DECAY_END = 182; //  Supply Decay ends on Week 234 (inclusive of Week 234 for a total of 195 weeks of inflation decay)

// Weekly percentage decay of inflationary supply from the first 52 weeks of the 100% inflation rate
uint public constant DECAY_RATE = 12500000000000000; // 1.25% weekly

// Percentage growth of terminal supply per annum
uint public constant TERMINAL_SUPPLY_RATE_ANNUAL = 50000000000000000; // 5% pa
```

### PERI FINANCE TOKEN ADDRESS ON DIFFERENT PLATFORM

#### ETH PLATFORM

```
PERI: 0x5d30ad9c6374bf925d0a75454fa327aacf778492
USDC: 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
DAI: 0x6b175474e89094c44da98b954eedeac495271d0f
pUSD: 0x0A51952e61a990E585316cAA3d6D15C8d3e55976
LP(UNI): 0x3530A9461788891b7f5b94148a6E82FFa6fd236a
```

#### BSC PLATFORM

```
PERI: 0xb49B7e0742EcB4240ffE91661d2A580677460b6A
USDC: 0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d
DAI: 0x1af3f329e8be154074d8769d1ffa4ee058b1dbc3
pUSD: 0xc9363d559D2e6DCAc6955A00B47d28326e07Cf07
LP(PANCAKE): 0xb68ebcec4c7aba66f5b8ed62e8c98b269cf918c8
```

#### POLYGON PLATFORM

```
PERI: 0xDC0E17eAE3B9651875030244b971fa0223a1764f
USDC: 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174
DAI: 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063
pUSD: 0xA590C980050d934c046920f8a9e0d9567536eDce
LP(QUICK): 0x98f675b60769abc732ee59685bffa19ea3c8e81c
```

