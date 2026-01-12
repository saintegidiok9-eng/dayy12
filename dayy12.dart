class Card 
{
  final String cardNumber;
  final int pin;

  Card(this.cardNumber, this.pin);
}

class Account 
{
  double _balance;

  Account(this._balance);

  double get balance => _balance;

  bool withdraw(double amount) 
{
    if (amount > 0 && amount <= _balance) 
{
      _balance -= amount;
      return true;
    }
    return false;
  }
}

class ATM 
{
  Card? _insertedCard;
  Account? _linkedAccount;

  void insertCard(Card card, Account account) 
{
    _insertedCard = card;
    _linkedAccount = account;
    print("Card inserted.");
  }

  bool enterPin(int pin) 
{
    if (_insertedCard == null) return false;
    if (_insertedCard!.pin == pin) 
{
      print("PIN accepted.");
      return true;
    }
    print("Wrong PIN.");
    return false;
  }

  void withdrawCash(double amount) 
{
    if (_linkedAccount == null)
{
      print("No account linked.");
      return;
    }

    bool success = _linkedAccount!.withdraw(amount);
    if (success) 
{
      print("Please take your cash: $amount");
    } else 
{
      print("Withdrawal failed.");
    }
  }

  void ejectCard() 
{
    _insertedCard = null;
    _linkedAccount = null;
    print("Card ejected.");
  }
}

void main() {
  Card card = Card("1234-5678", 4321);
  Account account = Account(1000);

  ATM atm = ATM();

  atm.insertCard(card, account);

  if (atm.enterPin(4321)) 
{
    atm.withdrawCash(300);
  }

  atm.ejectCard();
}
