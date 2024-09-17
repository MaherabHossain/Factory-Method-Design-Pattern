void main() {

  Dialog dialog = DialogFactory.createDialog(platform: 'ios', type: 'success');
  print(dialog.showDialog());

}

abstract class Dialog {
  String showDialog();
}


class AndroidWarningDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an Android Warning Dialog';
  }
}

class AndroidSuccessDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an Android Success Dialog';
  }
}

class AndroidDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an Android Dialog';
  }
}


class IosDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an iOS Dialog';
  }
}

class IosSuccessDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an iOS Success Dialog';
  }
}

class IosWarningDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an iOS Warning Dialog';
  }
}


class UnknownDialog extends Dialog {
  @override
  String showDialog() {
    return 'This is an unknown Dialog';
  }
}



class AndroidDialogFactory {
  static Dialog createDialog(String type) {
    if (type == 'warning') {
      return AndroidWarningDialog();
    } else if (type == 'success') {
      return AndroidSuccessDialog();
    } else {
      return AndroidDialog();
    }
  }
}

class IosDialogFactory{
    static Dialog createDialog(String type) {
    if (type == 'warning') {
      return IosWarningDialog();
    } else if (type == 'success') {
      return IosSuccessDialog();
    } else {
      return IosDialog();
    }
  }
}


class DialogFactory {
  static Dialog createDialog({ String platform = '', String type = ''}) {
    if (platform == 'android') {
      return AndroidDialogFactory.createDialog(type);
    } else if (platform == 'ios') {
      return IosDialogFactory.createDialog(type);
    } else {
      return UnknownDialog(); 
    }
  }
}
