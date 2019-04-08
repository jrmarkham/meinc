import 'package:flutter/material.dart';
import 'package:markham_enterprises_inc/src/ui/theme_style.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayEmailFormAnimation extends StatefulWidget {
  @override
  _OverlayEmailFormAnimationState createState() =>
      _OverlayEmailFormAnimationState();
}

class _EmailData {
  String subject = '';
  String body = '';
}

class _OverlayEmailFormAnimationState extends State<OverlayEmailFormAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _closing = false;
  final String title = 'Send an Email';
  final _EmailData _ed = _EmailData();
  final _emailKey = GlobalKey<FormState>();
  final String _to = 'support@markhamenterprises.com';
  String _responseMessage = '';

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.addListener(() {
      setState(() {});
      if (_closing && _controller.value < 0.01) {
        _closing = false;
        Navigator.of(context).pop();
        dispose();
      }
    });
    _controller.forward();
  }

  void _close() {
    _closing = true;
    _controller.reverse();
  }

  Widget _topBar() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 9,
          child: Center(
            child: Text(
              title,
              style: titleText(),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: _close,
          ),
        )
      ],
    );
  }

  Widget _contentList() {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(child: _emailForm()),
    );
  }

  Widget _subjectFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: formText(),
      validator: (val) {
        if (val.isEmpty) {
          return 'Please enter a subject.';
        }
        _ed.subject = val;
      },
      decoration: InputDecoration(
          labelText: 'Subject:',
          labelStyle: formText(),
          prefixStyle: formText()),
    );
  }

  Widget _bodyFormField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      style: formMessageText(),
      validator: (val) {
        if (val.isEmpty) {
          return 'Please enter a message.';
        }
        _ed.body = val;
      },
      decoration: InputDecoration(
          labelText: 'Mesage:',
          labelStyle: formText(),
          prefixStyle: formText()),
    );
  }

  void _resetForm() {
    setState(() {
      _ed.body = '';
      _ed.subject = '';
      _responseMessage = '';
      _emailKey.currentState.reset();
    });
  }

  void _submitEmail() async {
    // send Email
    if (_emailKey.currentState.validate()) {
      final url = 'mailto:$_to?subject=${_ed.subject}&body=${_ed.body}';
      //   Uri urlEncoded = Uri.encodeFull(url);
      var urlEncoded = Uri.encodeFull(url);
      if (await canLaunch(urlEncoded)) {
        await launch(urlEncoded);
        setState(() {
          _ed.body = '';
          _ed.subject = '';
          _emailKey.currentState.reset();
          _responseMessage = 'Email sent.';
        });
        return;
      }
      setState(() {
        _responseMessage = 'Your email couldn\'t be posted at this time.';
      });
    }
    // error message //
    return;
  }

  Widget _formResponse() {
    if (_responseMessage.isNotEmpty) {
      return Text(
        _responseMessage,
        style: mainText(),
      );
    }
    return Container();
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        mainButton('Submit', () => _submitEmail()),
        SizedBox(
          width: 5.0,
        ),
        mainButton('Reset', () => _emailKey.currentState.reset())
      ],
    );
  }

  Widget _emailForm() {
    return Material(

        /// color: Colors.white12,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
                key: _emailKey,
                child: Column(children: <Widget>[
                  _formResponse(),
                  _subjectFormField(),
                  _bodyFormField(),
                  _buttonRow()
                ]))));
  }

  Widget _getDisplay() {
    return Opacity(
        opacity: _controller.value,
        // mark container full screen //
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 20.0, top: 40.0),
            child: Column(
              children: <Widget>[_topBar(), _contentList()],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _getDisplay();
  }
}
