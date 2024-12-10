class LanguageResponseModel {
  Words words;

  LanguageResponseModel({
    required this.words,
  });

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) =>
      LanguageResponseModel(
        words: Words.fromJson(json["words"]),
      );

  Map<String, dynamic> toJson() => {
        "words": words.toJson(),
      };
}

class Words {
  CustomerLangData customer;

  Words({
    required this.customer,
  });

  factory Words.fromJson(Map<String, dynamic> json) =>
      Words(customer: CustomerLangData.fromJson(json["customer"]));

  Map<String, dynamic> toJson() => {"customer": customer.toJson()};
}

class CustomerLangData {
  final String area;
  final String superquality;
  final String possibilityofreservation;
  final String onboardfirsttext;
  final String pass;
  final String next;
  final String onboardsecondtext;
  final String onboardthirdtext;
  final String start;
  final String register;
  final String signupfirsttext;
  final String phonenumber;
  final String fullname;
  final String email;
  final String signupsecondtext;
  final String continu;
  final String otpauthentication;
  final String signupthirdtext;
  final String signupfourthtext;
  final String signupfifthtext;
  final String confirm;
  final String confirmed;
  final String signupsixthtext;
  final String cancel_action;
  final String termsandconditions;
  final String goback;
  final String agreewith;
  final String welcome;
  final String loginfirsttext;
  final String rememberme;
  final String enter;
  final String loginsecondtext;
  final String findacarwash;
  final String centersnearyou;
  final String all;
  final String latestoffers;
  final String homepage;
  final String branches;
  final String branch;
  final String offers;
  final String myaccount;
  final String filter;
  final String city;
  final String region;
  final String township;
  final String servicetype;
  final String evaluation;
  final String apply;
  final String workinghours;
  final String address;
  final String sedan;
  final String coupe;
  final String suv;
  final String pickup;
  final String seemapp;
  final String makereservation;
  final String reservation;
  final String choosecar;
  final String addcar;
  final String vehicletype;
  final String name;
  final String hondaaccord;
  final String number;
  final String remember;
  final String selectservice;
  final String selectdate;
  final String selectthehour;
  final String selectpaymenttype;
  final String selectthecar;
  final String reservationdetails;
  final String vehiclenameandnumber;
  final String service;
  final String dateandtime;
  final String paymenttype;
  final String price;
  final String booked;
  final String reservationfirsttext;
  final String superoffer;
  final String offer;
  final String personalinformation;
  final String cars;
  final String reservations;
  final String adjustments;
  final String notifications;
  final String exit;
  final String delete;
  final String detailed;
  final String active;
  final String history;
  final String status;
  final String cancelled;
  final String confirmedfirsttext;
  final String completed;
  final String bookagain;
  final String makechange;
  final String rate;
  final String send;
  final String sent;
  final String ritefirsttext;
  final String frequentlyaskedquestions;
  final String contactus;
  final String languages;
  final String note;
  final String unknownError;
  final String toCancel;
  final String notEmptyName;
  final String notEmptyPhone;
  final String refresh;
  final String select_branch;
  final String campaigns;
  final String visit_website;
  final String expiration_date;
  final String advertisements;
  final String Got_the_link;
  final String all_all;
  final String clean_car_evakuator;
  final String mobile_application_coming;
  final String phone_number_can;
  final String phone_format_incorrect;
  final String search_oil;
  final String search_details;
  final String read_more;
  final String at_branch;
  final String detailsss;
  final String products;
  final String referral_code;
  final String please_enter_valid;
  final String zoom_out;
  final String reklam;
  final String oils;
  final String it_clear;
  final String from_campaign;
  final String switch_stay_informed;
  final String new_new;

  CustomerLangData(
      {required this.area,
      required this.superquality,
      required this.possibilityofreservation,
      required this.onboardfirsttext,
      required this.pass,
      required this.next,
      required this.onboardsecondtext,
      required this.onboardthirdtext,
      required this.start,
      required this.register,
      required this.signupfirsttext,
      required this.phonenumber,
      required this.fullname,
      required this.email,
      required this.signupsecondtext,
      required this.continu,
      required this.otpauthentication,
      required this.signupthirdtext,
      required this.signupfourthtext,
      required this.signupfifthtext,
      required this.confirm,
      required this.confirmed,
      required this.signupsixthtext,
      required this.termsandconditions,
      required this.goback,
      required this.agreewith,
      required this.welcome,
      required this.loginfirsttext,
      required this.rememberme,
      required this.enter,
      required this.loginsecondtext,
      required this.findacarwash,
      required this.centersnearyou,
      required this.all,
      required this.latestoffers,
      required this.homepage,
      required this.branches,
      required this.offers,
      required this.myaccount,
      required this.filter,
      required this.city,
      required this.region,
      required this.township,
      required this.servicetype,
      required this.evaluation,
      required this.apply,
      required this.workinghours,
      required this.address,
      required this.sedan,
      required this.coupe,
      required this.suv,
      required this.pickup,
      required this.seemapp,
      required this.makereservation,
      required this.reservation,
      required this.choosecar,
      required this.addcar,
      required this.vehicletype,
      required this.name,
      required this.hondaaccord,
      required this.number,
      required this.remember,
      required this.selectservice,
      required this.selectdate,
      required this.selectthehour,
      required this.selectpaymenttype,
      required this.selectthecar,
      required this.reservationdetails,
      required this.vehiclenameandnumber,
      required this.service,
      required this.dateandtime,
      required this.paymenttype,
      required this.price,
      required this.booked,
      required this.reservationfirsttext,
      required this.superoffer,
      required this.offer,
      required this.personalinformation,
      required this.cars,
      required this.reservations,
      required this.adjustments,
      required this.notifications,
      required this.exit,
      required this.delete,
      required this.detailed,
      required this.active,
      required this.history,
      required this.status,
      required this.cancelled,
      required this.confirmedfirsttext,
      required this.completed,
      required this.bookagain,
      required this.makechange,
      required this.rate,
      required this.send,
      required this.sent,
      required this.ritefirsttext,
      required this.frequentlyaskedquestions,
      required this.contactus,
      required this.note,
      required this.languages,
      required this.unknownError,
      required this.toCancel,
      required this.notEmptyName,
      required this.notEmptyPhone,
      required this.refresh,
      required this.branch,
      required this.cancel_action,
      required this.select_branch,
      required this.campaigns,
      required this.visit_website,
      required this.expiration_date,
      required this.advertisements,
      required this.Got_the_link,
      required this.all_all,
      required this.clean_car_evakuator,
      required this.mobile_application_coming,
      required this.phone_number_can,
      required this.phone_format_incorrect,
      required this.search_oil,
      required this.search_details,
      required this.read_more,
      required this.at_branch,
      required this.detailsss,
      required this.products,
      required this.referral_code,
      required this.please_enter_valid,
      required this.zoom_out,
      required this.reklam,
      required this.oils,
      required this.it_clear,
      required this.from_campaign,
      required this.switch_stay_informed,
      required this.new_new});

  factory CustomerLangData.fromJson(Map<String, dynamic> json) =>
      CustomerLangData(
        area: json['area'],
        branch: json['branch'],
        superquality: json['super_quality'],
        possibilityofreservation: json['possibility_of_reservation'],
        onboardfirsttext: json['onboard_first_text'],
        pass: json['pass'],
        next: json['next'],
        onboardsecondtext: json['onboard_second_text'],
        onboardthirdtext: json['onboard_third_text'],
        start: json['start'],
        register: json['register'],
        signupfirsttext: json['signup_first_text'],
        phonenumber: json['phone_number'],
        fullname: json['full_name'],
        email: json['email'],
        signupsecondtext: json['signup_second_text'],
        continu: json['continue'],
        otpauthentication: json['otp_authentication'],
        signupthirdtext: json['signup_third_text'],
        signupfourthtext: json['signup_fourth_text'],
        signupfifthtext: json['signup_fifth_text'],
        confirm: json['confirm'],
        confirmed: json['confirmed'],
        signupsixthtext: json['signup_sixth_text'],
        termsandconditions: json['terms_and_conditions'],
        goback: json['go_back'],
        agreewith: json['agree_with'],
        welcome: json['welcome'],
        loginfirsttext: json['login_first_text'],
        rememberme: json['remember_me'],
        enter: json['enter'],
        loginsecondtext: json['login_second_text'],
        findacarwash: json['find_a_car_wash'],
        centersnearyou: json['centers_near_you'],
        all: json['all'],
        latestoffers: json['latest_offers'],
        homepage: json['home_page'],
        branches: json['branches'],
        offers: json['offers'],
        myaccount: json['my_account'],
        filter: json['filter'],
        city: json['city'],
        region: json['region'],
        township: json['township'],
        servicetype: json['service_type'],
        evaluation: json['evaluation'],
        apply: json['apply'],
        workinghours: json['working_hours'],
        address: json['address'],
        sedan: json['sedan'],
        coupe: json['coupe'],
        suv: json['suv'],
        pickup: json['pickup'],
        seemapp: json['see_mapp'],
        makereservation: json['make_reservation'],
        reservation: json['reservation'],
        choosecar: json['choose_car'],
        addcar: json['add_car'],
        vehicletype: json['vehicle_type'],
        name: json['name'],
        hondaaccord: json['honda_accord'],
        number: json['number'],
        remember: json['remember'],
        selectservice: json['select_service'],
        selectdate: json['select_date'],
        selectthehour: json['select_the_hour'],
        selectpaymenttype: json['select_payment_type'],
        selectthecar: json['select_the_car'],
        reservationdetails: json['reservation_details'],
        vehiclenameandnumber: json['vehicle_name_and_number'],
        service: json['service'],
        dateandtime: json['date_and_time'],
        paymenttype: json['payment_type'],
        price: json['price'],
        booked: json['booked'],
        reservationfirsttext: json['reservation_first_text'],
        superoffer: json['super_offer'],
        offer: json['offer'],
        personalinformation: json['personal_information'],
        cars: json['cars'],
        reservations: json['reservations'],
        adjustments: json['adjustments'],
        notifications: json['notifications'],
        exit: json['exit'],
        delete: json['delete'],
        detailed: json['detailed'],
        active: json['active'],
        history: json['history'],
        status: json['status'],
        cancelled: json['cancelled'],
        confirmedfirsttext: json['confirmed_first_text'],
        completed: json['completed'],
        bookagain: json['book_again'],
        makechange: json['make_change'],
        rate: json['rate'],
        send: json['send'],
        sent: json['sent'],
        ritefirsttext: json['rite_first_text'],
        frequentlyaskedquestions: json['frequently_asked_question'],
        contactus: json['contact_us'],
        languages: json['languages'],
        note: json['note'],
        unknownError: json['unknown_error'],
        toCancel: json['to_cancel'],
        notEmptyName: json['not_empty_name'],
        notEmptyPhone: json['not_empty_phone'],
        refresh: json['refresh'],
        cancel_action: json['cancel_action'],
        select_branch: json['- select_branch'],
        campaigns: json['campaigns'],
        visit_website: json['visit_website'],
        expiration_date: json['expiration_date'],
        advertisements: json['advertisements'],
        Got_the_link: json['Got_the_link'],
        all_all: json['all_all'],
        clean_car_evakuator: json['clean_car_evakuator'],
        mobile_application_coming: json['mobile_application_coming'],
        phone_number_can: json['phone_number_can'],
        phone_format_incorrect: json['phone_format_incorrect'],
        search_oil: json['search_oil'],
        search_details: json['search_details'],
        read_more: json['read_more'],
        at_branch: json['at_branch'],
        detailsss: json['detailsss'],
        products: json['products'],
        referral_code: json['referral_code'],
        please_enter_valid: json['please_enter_valid'],
        zoom_out: json['zoom_out'],
        reklam: json['reklam'],
        oils: json['oils'],
        it_clear: json['it_clear'],
        new_new: json['new_new'],
        switch_stay_informed: json['switch_stay_informed'],
        from_campaign: json['from_campaign'],
      );

  Map<String, dynamic> toJson() {
    return {
      'area': area,
      'super_quality': superquality,
      'possibility_of_reservation': possibilityofreservation,
      'onboard_first_text': onboardfirsttext,
      'pass': pass,
      'next': next,
      'onboard_second_text': onboardsecondtext,
      'onboard_third_text': onboardthirdtext,
      'start': start,
      'register': register,
      'signup_first_text': signupfirsttext,
      'phone_number': phonenumber,
      'full_name': fullname,
      'email': email,
      'signup_second_text': signupsecondtext,
      'continue': continu,
      'otp_authentication': otpauthentication,
      'signup_third_text': signupthirdtext,
      'signup_fourth_text': signupfourthtext,
      'signup_fifth_text': signupfifthtext,
      'confirm': confirm,
      'confirmed': confirmed,
      'signup_sixth_text': signupsixthtext,
      'terms_and_conditions': termsandconditions,
      'go_back': goback,
      'agree_with': agreewith,
      'welcome': welcome,
      'login_first_text': loginfirsttext,
      'remember_me': rememberme,
      'enter': enter,
      'login_second_text': loginsecondtext,
      'find_a_car_wash': findacarwash,
      'centers_near_you': centersnearyou,
      'all': all,
      'latest_offers': latestoffers,
      'home_page': homepage,
      'branches': branches,
      'offers': offers,
      'my_account': myaccount,
      'filter': filter,
      'city': city,
      'region': region,
      'township': township,
      'service_type': servicetype,
      'evaluation': evaluation,
      'apply': apply,
      'working_hours': workinghours,
      'address': address,
      'sedan': sedan,
      'coupe': coupe,
      'suv': suv,
      'pickup': pickup,
      'see_mapp': seemapp,
      'make_reservation': makereservation,
      'reservation': reservation,
      'choose_car': choosecar,
      'add_car': addcar,
      'vehicle_type': vehicletype,
      'name': name,
      'honda_accord': hondaaccord,
      'number': number,
      'remember': remember,
      'select_service': selectservice,
      'select_date': selectdate,
      'select_the_hour': selectthehour,
      'select_payment_type': selectpaymenttype,
      'select_the_car': selectthecar,
      'reservation_details': reservationdetails,
      'vehicle_name_and_number': vehiclenameandnumber,
      'service': service,
      'date_and_time': dateandtime,
      'payment_type': paymenttype,
      'price': price,
      'booked': booked,
      'reservation_first_text': reservationfirsttext,
      'super_offer': superoffer,
      'offer': offer,
      'personal_information': personalinformation,
      'cars': cars,
      'reservations': reservations,
      'adjustments': adjustments,
      'notifications': notifications,
      'exit': exit,
      'delete': delete,
      'detailed': detailed,
      'active': active,
      'history': history,
      'status': status,
      'cancelled': cancelled,
      'confirmed_first_text': confirmedfirsttext,
      'completed': completed,
      'book_again': bookagain,
      'make_change': makechange,
      'rate': rate,
      'send': send,
      'sent': sent,
      'rite_first_text': ritefirsttext,
      'frequently_asked_question': frequentlyaskedquestions,
      'contact_us': contactus,
      'languages': languages,
      'note': note,
      'to_cancel': toCancel,
      'unknown_error': unknownError,
      'not_empty_name': notEmptyName,
      'not_empty_phone': notEmptyPhone,
      'refresh': refresh,
      'branch': branch,
      'cancel_action': cancel_action,
      '- select_branch': select_branch,
      'campaigns': campaigns,
      'visit_website': visit_website,
      'expiration_date': expiration_date,
      'advertisements': advertisements,
      'Got_the_link': Got_the_link,
      'all_all': all_all,
      'clean_car_evakuator': clean_car_evakuator,
      'mobile_application_coming': mobile_application_coming,
      'phone_number_can': phone_number_can,
      'phone_format_incorrect': phone_format_incorrect,
      'search_oil': search_oil,
      'search_details': search_details,
      'read_more': read_more,
      'at_branch': at_branch,
      'detailsss': detailsss,
      'products': products,
      'referral_code': referral_code,
      'please_enter_valid': please_enter_valid,
      'zoom_out': zoom_out,
      'reklam': reklam,
      'oils': oils,
      'it_clear': it_clear,
      'new_new': new_new,
      'switch_stay_informed': switch_stay_informed,
      'from_campaign': from_campaign,
    };
  }
}
