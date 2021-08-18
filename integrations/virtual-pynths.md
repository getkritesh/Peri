# Virtual Pynths API

There are two steps to Virtual Pynths

1. Create the virtual synth contract via PeriFinance.exchangeWithVirtual\(\)- this function outputs the new VirtualPynth contract address for the next step
2. Once VirtualPynth.secsLeftInWaitingPeriod is 0\(and it's readyToSettle\), invoke  VirtualPynth.settle\(address\) to burn the virtual pynths and transfer the proportion of underlying pynths to the address.

#### 1. Creation of Virtual Pynth Contract <a id="1-creation-of-virtual-synth-contract"></a>

