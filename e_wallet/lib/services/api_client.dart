class Country{
  String name;
  String urlFlag;
  String currencey;
  Country({required this.name,required this.currencey,required this.urlFlag});
}

final List<Country> datas=[
  Country(
    name: 'USA',
    urlFlag: 'https://images-na.ssl-images-amazon.com/images/I/61gnrswHuBL._AC_SL1024_.jpg',
    currencey: 'USD',
  ),
  Country(
      name: 'VietNam',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/twitter/259/flag-vietnam_1f1fb-1f1f3.png',
      currencey: "VND"
  ),
  Country(
      name: 'Australia',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/openmoji/272/flag-australia_1f1e6-1f1fa.png',
      currencey: 'AUD'
  ),
  Country(
      name: 'Korea South',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/openmoji/272/flag-south-korea_1f1f0-1f1f7.png',
      currencey: 'KRW'
  ),
  Country(
      name: 'Japan',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/openmoji/272/flag-japan_1f1ef-1f1f5.png',
      currencey: 'JPY'
  ),
  Country(
      name: 'Canada',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/openmoji/272/flag-canada_1f1e8-1f1e6.png',
      currencey: 'CAD'
  ),
  Country(
      name: 'Russia',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/openmoji/272/flag-russia_1f1f7-1f1fa.png',
      currencey: 'RUS'
  ),
  Country(
      name: 'Germany',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/openmoji/272/flag-germany_1f1e9-1f1ea.png',
      currencey: 'EUR'
  ),
  Country(
      name: 'United Kingdom',
      urlFlag: 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/openmoji/272/flag-united-kingdom_1f1ec-1f1e7.png',
      currencey: 'GBP'
  ),
];