class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.inputUTXOs = inputUTXOs;
        this.outputUTXOs = outputUTXOs;
    }
    execute() {
        let inputTotalValue = 0;
        let outputTotalValue = 0;

        this.inputUTXOs.forEach((input) => {
            const {spent, amount} = input;
            inputTotalValue += amount;  
            if (spent) {
                throw "already spent"
            }
        });

        this.outputUTXOs.forEach((output) => {
            const {amount} = output; 
            outputTotalValue += amount;  
        }); 

        if (inputTotalValue < outputTotalValue){
            throw "is less than"
        }
    
        this.inputUTXOs.forEach((input) => {
        input.spend();
        });

        this.outputUTXOs.forEach((output) => {
        output.spend();
        });
        
        const fee = inputTotalValue - outputTotalValue;
        if(fee >= 0){
            this.fee = fee;
        }
    }
    
}

module.exports = Transaction;
