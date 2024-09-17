void main() {
  
  PaymentFactory cardFactory = CardPaymentFactory();
  Payment cardPayment = cardFactory.createPayment();
  print(cardPayment.transfer(200));

  
  PaymentFactory bankFactory = BankPaymentFactory();
  Payment bankPayment = bankFactory.createBankPayment('dbbl');
  print(bankPayment.transfer(200));
}


abstract class Payment {
  String transfer(int amount);
}


class TransferToCard extends Payment {
  @override
  String transfer(int amount) {
    return 'Transfer $amount to card';
  }
}

class TransferToIBBL extends Payment {
  @override
  String transfer(int amount) {
    return 'Transfer $amount to IBBL';
  }
}

class TransferToCity extends Payment {
  @override
  String transfer(int amount) {
    return 'Transfer $amount to City Bank';
  }
}

class TransferToDBBL extends Payment {
  @override
  String transfer(int amount) {
    return 'Transfer $amount to DBBL';
  }
}

class InvalidBank extends Payment {
  @override
  String transfer(int amount) {
    return 'Unable to transfer $amount';
  }
}


abstract class PaymentFactory {
  Payment createPayment(); 
  Payment createBankPayment(String bankName);
}


class CardPaymentFactory extends PaymentFactory {
  @override
  Payment createPayment() {
    return TransferToCard();
  }

  @override
  Payment createBankPayment(String bankName) {
    throw UnsupportedError('This factory does not support bank payments');
  }
}


class BankPaymentFactory extends PaymentFactory {
  @override
  Payment createPayment() {
    throw UnsupportedError('This factory does not support card payments');
  }

  @override
  Payment createBankPayment(String bankName) {
    if (bankName == 'city') {
      return TransferToCity();
    } else if (bankName == 'ibbl') {
      return TransferToIBBL();
    } else if (bankName == 'dbbl') {
      return TransferToDBBL();
    } else {
      return InvalidBank();
    }
  }
}
