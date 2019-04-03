import 'dart:io';

import 'package:markham_enterprises_inc/src/models/company.dart';

class HardCodedRepo {
  static final Company me = Company(
      name: 'Markham Enterprises Inc.',
      philosophy: _getPhil(),
      technology: _getTech(),
      about: _getAbout(),
      logos: <String>[
        'assets/images/icons/logoSquareME.png',
        'assets/images/icons/logoSquareMEGA.png',
      ],
      backdropPhotos: <String>[
        'assets/images/backs/logoME.png',
        'assets/images/backs/logoMEGA.png'
      ],
      links: <Link>[
        Link(
            name: 'Markham Enterprises Inc.',
            url: 'https://www.markhamenterprises.com'),
        Link(
            name: 'Markham Enterprises Inc. Games and Apps [MEGA]',
            url: 'https://mega.markhamenterprises.com'),
      ],
      works: <Work>[
        Work(
            title: 'The Snowball Fight',
            type: 'Mobile Game (Starling/Air)',
            thumbnail: 'assets/images/works/snow.png',
            url: 'https://thesnowballfight.markhamenterprises.com'),
        Work(
            title: 'The JavaScript Pool Game',
            type: 'Web Game (JavaScript)',
            thumbnail: 'assets/images/works/pool.png',
            url: 'https://markhamenterprises.com/portfolio/hs_v17/'),
        Work(
            title: 'Bugle (coing soon)',
            type: 'Mobile App (Flutter)',
            thumbnail: 'assets/images/works/bugle.png',
            url: 'https://meinc.markhamenterprises.com'),
        Work(
            title: 'Markham Enterprises Inc. App',
            type: 'Mobile App (Flutter)',
            thumbnail: 'assets/images/works/me.png',
            url: 'https://bugle.markhamenterprises.com'),
      ]);

  static String _getPhil() {
    return 'Markham Enterprises Inc. provides multimedia solutions to various clients with a multitude of web and software needs. We believe multimedia solutions are the best method and most cost-effective ways of communicating your business\'s message your way. The concept of multimedia is one integration; the combination solution of several formats in one; instead of being restricted to one such as the traditional Media of print, film, and text.'
        '\n\nWeb solutions are also more reusable than other solutions. Markham Enterprises Inc. assumes after your project is finished with us that it will continue to grow, as your business grows. So with that in mind, we seek to provide data-driven solutions that are dynamic and easy for the client to reuse and re-purpose.'
        '\n\nMost Web solutions can also be used in conjunction with the more traditional Media.'
        '\n\nPart of Markham Enterprises Inc.’s goal to meet clients’ multimedia needs is to educate our client on all the various options of a multimedia solution. It is our belief that clients represent a need or a problem and as media professionals, we need to fill those needs opposed to providing solutions or services that are often predetermined templates that lack personalization and flexibility.'
        '\n\nWhen a client commissions a solution from Markham Enterprises Inc. we make sure we ask all the questions our clients need us to ask for providing answers to their needs. We also try to provide options for all solutions which incorporate cost time and flexibility.'
        '\n\nWe feel at Markham Enterprises Inc. that your brand and message extends beyond your logo, so your website and your core message must clearly, immediate and concisely be presented to the user. Your audience must immediately understand what your business is about. For example, if you are a rock band then your initial message must be your music. If you\'re a photographer or other visual artists then your message must initially include some sort of image gallery. Examples could go on and on, but the point is your brand and message goes beyond a clever graphics or type font.'
        '\n\nWith this in mind, we would ensure that the user would always have the heart of your message center of the web(or other media solution.) If you force your user to click three times to get to a rock band’s song then that is three clicks too many. Someone looking to hire a photographer won’t wait to read text or learn an unfriendly interface before they can actually see examples of the photographer\'s work at photographer may have lost a client. At any time in the multimedia experience, this branding message should be accessible to the user at all times.'
        '\n\nOur client\'s dynamic success is our success.';
  }

  static String _getAbout() {
    return 'Markham Enterprises Inc Founder: John Markham'
        '\n\nEmail: me@markhamenterprises.com'
        '\n\n========================'
        '\n\nI created Markham Enterprises Inc in 2007. As an experienced multi-industry web professional, I have been involved with groundbreaking media applications, software development and Internet solutions for the past 20 years. With a breadth of experience branching many industries and work practices. Through these experiences, I have honed the best technologies solution with the best processes to develop elegant and efficient solutions. Throughout my work experiences, I have had the good fortune to work with some of the most creative and experienced people from several industries. Markham Enterprises Inc. endeavors to provide the best solutions tailored to the needs of the client as determined by, time, message and budget.\n\n-John Markham\n\n'
        '\n\n========================'
        '\n\nMEGA or Markham Enterprises Inc Games and Apps is an extension of Markham Enterprises Inc that focuses on mobile game development. MEGA launched its first game \'The Snowball Fight\' in mid 2017 on the iOS platform at iTunes Store and next then Android version on the Google Play Store in early 2018. Current nd future mobile projects are using the Flutter framework by Google.';
  }

  static String _getTech() {
    return 'Markham Enterprises is an all-purpose multimedia webshop. Whether you need quick agency work, web applications, media, and games or a complete data-driven website; you can find your web technology solutions here.\n\nWhile Markham Enterprise Inc. focuses on media applications and front-end solutions, Markham Enterprise Inc. fulfills any needs your company has an integrated media solution. We work with other companies through your partnerships or our partnerships in order to establish the best relationships and plan to achieve your goals.'
        '\n\n========================'
        '\n\nMEGA or Markham Enterprises Inc Games and Apps is an extension of Markham Enterprises Inc that focuses on mobile game development. MEGA launched its first game \'The Snowball Fight\' in mid 2017 on the iOS platform at iTunes Store and next then Android version on the Google Play Store in early 2018. Current nd future mobile projects are using the Flutter framework by Google.'
        '\n\nCORE TECHNOLOGIES AND COMPETENCIES'
        '\nFlutter and Dart'
        '\nJavaScript'
        '\nJavaScript Libraries'
        '\nActionScript and Starling'
        '\nPHP'
        '\nHTML'
        '\nCSS, LESS AND SASS'
        '\nXML, YML AND JSON'
        '\nAdobe Photoshop'
        '\nAdobe Illustrator'
        '\nWeb Development'
        '\nMobile Web Development'
        '\nGame Development'
        '\nMobile Game Development'
        '\nMobile Application Development'
        '\nWeb Application Development'
        '\nAdvertising and Marketing'
        '\nBranding';
  }
}
