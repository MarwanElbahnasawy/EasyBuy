// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The three-letter currency codes that represent the world currencies used in stores. These include standard ISO 4217 codes, legacy codes,
/// and non-standard codes.
public enum CurrencyCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// United States Dollars (USD).
  case usd
  /// Euro (EUR).
  case eur
  /// United Kingdom Pounds (GBP).
  case gbp
  /// Canadian Dollars (CAD).
  case cad
  /// Afghan Afghani (AFN).
  case afn
  /// Albanian Lek (ALL).
  case all
  /// Algerian Dinar (DZD).
  case dzd
  /// Angolan Kwanza (AOA).
  case aoa
  /// Argentine Pesos (ARS).
  case ars
  /// Armenian Dram (AMD).
  case amd
  /// Aruban Florin (AWG).
  case awg
  /// Australian Dollars (AUD).
  case aud
  /// Barbadian Dollar (BBD).
  case bbd
  /// Azerbaijani Manat (AZN).
  case azn
  /// Bangladesh Taka (BDT).
  case bdt
  /// Bahamian Dollar (BSD).
  case bsd
  /// Bahraini Dinar (BHD).
  case bhd
  /// Burundian Franc (BIF).
  case bif
  /// Belize Dollar (BZD).
  case bzd
  /// Bermudian Dollar (BMD).
  case bmd
  /// Bhutanese Ngultrum (BTN).
  case btn
  /// Bosnia and Herzegovina Convertible Mark (BAM).
  case bam
  /// Brazilian Real (BRL).
  case brl
  /// Bolivian Boliviano (BOB).
  case bob
  /// Botswana Pula (BWP).
  case bwp
  /// Brunei Dollar (BND).
  case bnd
  /// Bulgarian Lev (BGN).
  case bgn
  /// Burmese Kyat (MMK).
  case mmk
  /// Cambodian Riel.
  case khr
  /// Cape Verdean escudo (CVE).
  case cve
  /// Cayman Dollars (KYD).
  case kyd
  /// Central African CFA Franc (XAF).
  case xaf
  /// Chilean Peso (CLP).
  case clp
  /// Chinese Yuan Renminbi (CNY).
  case cny
  /// Colombian Peso (COP).
  case cop
  /// Comorian Franc (KMF).
  case kmf
  /// Congolese franc (CDF).
  case cdf
  /// Costa Rican Colones (CRC).
  case crc
  /// Croatian Kuna (HRK).
  case hrk
  /// Czech Koruny (CZK).
  case czk
  /// Danish Kroner (DKK).
  case dkk
  /// Dominican Peso (DOP).
  case dop
  /// East Caribbean Dollar (XCD).
  case xcd
  /// Egyptian Pound (EGP).
  case egp
  /// Ethiopian Birr (ETB).
  case etb
  /// CFP Franc (XPF).
  case xpf
  /// Fijian Dollars (FJD).
  case fjd
  /// Gambian Dalasi (GMD).
  case gmd
  /// Ghanaian Cedi (GHS).
  case ghs
  /// Guatemalan Quetzal (GTQ).
  case gtq
  /// Guyanese Dollar (GYD).
  case gyd
  /// Georgian Lari (GEL).
  case gel
  /// Haitian Gourde (HTG).
  case htg
  /// Honduran Lempira (HNL).
  case hnl
  /// Hong Kong Dollars (HKD).
  case hkd
  /// Hungarian Forint (HUF).
  case huf
  /// Icelandic Kronur (ISK).
  case isk
  /// Indian Rupees (INR).
  case inr
  /// Indonesian Rupiah (IDR).
  case idr
  /// Israeli New Shekel (NIS).
  case ils
  /// Iraqi Dinar (IQD).
  case iqd
  /// Jamaican Dollars (JMD).
  case jmd
  /// Japanese Yen (JPY).
  case jpy
  /// Jersey Pound.
  case jep
  /// Jordanian Dinar (JOD).
  case jod
  /// Kazakhstani Tenge (KZT).
  case kzt
  /// Kenyan Shilling (KES).
  case kes
  /// Kuwaiti Dinar (KWD).
  case kwd
  /// Kyrgyzstani Som (KGS).
  case kgs
  /// Laotian Kip (LAK).
  case lak
  /// Latvian Lati (LVL).
  case lvl
  /// Lebanese Pounds (LBP).
  case lbp
  /// Lesotho Loti (LSL).
  case lsl
  /// Liberian Dollar (LRD).
  case lrd
  /// Lithuanian Litai (LTL).
  case ltl
  /// Malagasy Ariary (MGA).
  case mga
  /// Macedonia Denar (MKD).
  case mkd
  /// Macanese Pataca (MOP).
  case mop
  /// Malawian Kwacha (MWK).
  case mwk
  /// Maldivian Rufiyaa (MVR).
  case mvr
  /// Mexican Pesos (MXN).
  case mxn
  /// Malaysian Ringgits (MYR).
  case myr
  /// Mauritian Rupee (MUR).
  case mur
  /// Moldovan Leu (MDL).
  case mdl
  /// Moroccan Dirham.
  case mad
  /// Mongolian Tugrik.
  case mnt
  /// Mozambican Metical.
  case mzn
  /// Namibian Dollar.
  case nad
  /// Nepalese Rupee (NPR).
  case npr
  /// Netherlands Antillean Guilder.
  case ang
  /// New Zealand Dollars (NZD).
  case nzd
  /// Nicaraguan Córdoba (NIO).
  case nio
  /// Nigerian Naira (NGN).
  case ngn
  /// Norwegian Kroner (NOK).
  case nok
  /// Omani Rial (OMR).
  case omr
  /// Panamian Balboa (PAB).
  case pab
  /// Pakistani Rupee (PKR).
  case pkr
  /// Papua New Guinean Kina (PGK).
  case pgk
  /// Paraguayan Guarani (PYG).
  case pyg
  /// Peruvian Nuevo Sol (PEN).
  case pen
  /// Philippine Peso (PHP).
  case php
  /// Polish Zlotych (PLN).
  case pln
  /// Qatari Rial (QAR).
  case qar
  /// Romanian Lei (RON).
  case ron
  /// Russian Rubles (RUB).
  case rub
  /// Rwandan Franc (RWF).
  case rwf
  /// Samoan Tala (WST).
  case wst
  /// Saudi Riyal (SAR).
  case sar
  /// Serbian dinar (RSD).
  case rsd
  /// Seychellois Rupee (SCR).
  case scr
  /// Singapore Dollars (SGD).
  case sgd
  /// Sudanese Pound (SDG).
  case sdg
  /// Syrian Pound (SYP).
  case syp
  /// South African Rand (ZAR).
  case zar
  /// South Korean Won (KRW).
  case krw
  /// South Sudanese Pound (SSP).
  case ssp
  /// Solomon Islands Dollar (SBD).
  case sbd
  /// Sri Lankan Rupees (LKR).
  case lkr
  /// Surinamese Dollar (SRD).
  case srd
  /// Swazi Lilangeni (SZL).
  case szl
  /// Swedish Kronor (SEK).
  case sek
  /// Swiss Francs (CHF).
  case chf
  /// Taiwan Dollars (TWD).
  case twd
  /// Thai baht (THB).
  case thb
  /// Tanzanian Shilling (TZS).
  case tzs
  /// Trinidad and Tobago Dollars (TTD).
  case ttd
  /// Tunisian Dinar (TND).
  case tnd
  /// Turkish Lira (TRY).
  case `try`
  /// Turkmenistani Manat (TMT).
  case tmt
  /// Ugandan Shilling (UGX).
  case ugx
  /// Ukrainian Hryvnia (UAH).
  case uah
  /// United Arab Emirates Dirham (AED).
  case aed
  /// Uruguayan Pesos (UYU).
  case uyu
  /// Uzbekistan som (UZS).
  case uzs
  /// Vanuatu Vatu (VUV).
  case vuv
  /// Vietnamese đồng (VND).
  case vnd
  /// West African CFA franc (XOF).
  case xof
  /// Yemeni Rial (YER).
  case yer
  /// Zambian Kwacha (ZMW).
  case zmw
  /// Belarusian Ruble (BYN).
  case byn
  /// Belarusian Ruble (BYR).
  @available(*, deprecated, message: "`BYR` is deprecated. Use `BYN` available from version `2021-01` onwards instead.")
  case byr
  /// Djiboutian Franc (DJF).
  case djf
  /// Eritrean Nakfa (ERN).
  case ern
  /// Falkland Islands Pounds (FKP).
  case fkp
  /// Gibraltar Pounds (GIP).
  case gip
  /// Guinean Franc (GNF).
  case gnf
  /// Iranian Rial (IRR).
  case irr
  /// Kiribati Dollar (KID).
  case kid
  /// Libyan Dinar (LYD).
  case lyd
  /// Mauritanian Ouguiya (MRU).
  case mru
  /// Sierra Leonean Leone (SLL).
  case sll
  /// Saint Helena Pounds (SHP).
  case shp
  /// Somali Shilling (SOS).
  case sos
  /// Sao Tome And Principe Dobra (STD).
  @available(*, deprecated, message: "`STD` is deprecated. Use `STN` available from version `2022-07` onwards instead.")
  case std
  /// Sao Tome And Principe Dobra (STN).
  case stn
  /// Tajikistani Somoni (TJS).
  case tjs
  /// Tongan Pa'anga (TOP).
  case top
  /// Venezuelan Bolivares (VED).
  case ved
  /// Venezuelan Bolivares (VEF).
  @available(*, deprecated, message: "`VEF` is deprecated. Use `VES` available from version `2020-10` onwards instead.")
  case vef
  /// Venezuelan Bolivares (VES).
  case ves
  /// Unrecognized currency.
  case xxx
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "USD": self = .usd
      case "EUR": self = .eur
      case "GBP": self = .gbp
      case "CAD": self = .cad
      case "AFN": self = .afn
      case "ALL": self = .all
      case "DZD": self = .dzd
      case "AOA": self = .aoa
      case "ARS": self = .ars
      case "AMD": self = .amd
      case "AWG": self = .awg
      case "AUD": self = .aud
      case "BBD": self = .bbd
      case "AZN": self = .azn
      case "BDT": self = .bdt
      case "BSD": self = .bsd
      case "BHD": self = .bhd
      case "BIF": self = .bif
      case "BZD": self = .bzd
      case "BMD": self = .bmd
      case "BTN": self = .btn
      case "BAM": self = .bam
      case "BRL": self = .brl
      case "BOB": self = .bob
      case "BWP": self = .bwp
      case "BND": self = .bnd
      case "BGN": self = .bgn
      case "MMK": self = .mmk
      case "KHR": self = .khr
      case "CVE": self = .cve
      case "KYD": self = .kyd
      case "XAF": self = .xaf
      case "CLP": self = .clp
      case "CNY": self = .cny
      case "COP": self = .cop
      case "KMF": self = .kmf
      case "CDF": self = .cdf
      case "CRC": self = .crc
      case "HRK": self = .hrk
      case "CZK": self = .czk
      case "DKK": self = .dkk
      case "DOP": self = .dop
      case "XCD": self = .xcd
      case "EGP": self = .egp
      case "ETB": self = .etb
      case "XPF": self = .xpf
      case "FJD": self = .fjd
      case "GMD": self = .gmd
      case "GHS": self = .ghs
      case "GTQ": self = .gtq
      case "GYD": self = .gyd
      case "GEL": self = .gel
      case "HTG": self = .htg
      case "HNL": self = .hnl
      case "HKD": self = .hkd
      case "HUF": self = .huf
      case "ISK": self = .isk
      case "INR": self = .inr
      case "IDR": self = .idr
      case "ILS": self = .ils
      case "IQD": self = .iqd
      case "JMD": self = .jmd
      case "JPY": self = .jpy
      case "JEP": self = .jep
      case "JOD": self = .jod
      case "KZT": self = .kzt
      case "KES": self = .kes
      case "KWD": self = .kwd
      case "KGS": self = .kgs
      case "LAK": self = .lak
      case "LVL": self = .lvl
      case "LBP": self = .lbp
      case "LSL": self = .lsl
      case "LRD": self = .lrd
      case "LTL": self = .ltl
      case "MGA": self = .mga
      case "MKD": self = .mkd
      case "MOP": self = .mop
      case "MWK": self = .mwk
      case "MVR": self = .mvr
      case "MXN": self = .mxn
      case "MYR": self = .myr
      case "MUR": self = .mur
      case "MDL": self = .mdl
      case "MAD": self = .mad
      case "MNT": self = .mnt
      case "MZN": self = .mzn
      case "NAD": self = .nad
      case "NPR": self = .npr
      case "ANG": self = .ang
      case "NZD": self = .nzd
      case "NIO": self = .nio
      case "NGN": self = .ngn
      case "NOK": self = .nok
      case "OMR": self = .omr
      case "PAB": self = .pab
      case "PKR": self = .pkr
      case "PGK": self = .pgk
      case "PYG": self = .pyg
      case "PEN": self = .pen
      case "PHP": self = .php
      case "PLN": self = .pln
      case "QAR": self = .qar
      case "RON": self = .ron
      case "RUB": self = .rub
      case "RWF": self = .rwf
      case "WST": self = .wst
      case "SAR": self = .sar
      case "RSD": self = .rsd
      case "SCR": self = .scr
      case "SGD": self = .sgd
      case "SDG": self = .sdg
      case "SYP": self = .syp
      case "ZAR": self = .zar
      case "KRW": self = .krw
      case "SSP": self = .ssp
      case "SBD": self = .sbd
      case "LKR": self = .lkr
      case "SRD": self = .srd
      case "SZL": self = .szl
      case "SEK": self = .sek
      case "CHF": self = .chf
      case "TWD": self = .twd
      case "THB": self = .thb
      case "TZS": self = .tzs
      case "TTD": self = .ttd
      case "TND": self = .tnd
      case "TRY": self = .try
      case "TMT": self = .tmt
      case "UGX": self = .ugx
      case "UAH": self = .uah
      case "AED": self = .aed
      case "UYU": self = .uyu
      case "UZS": self = .uzs
      case "VUV": self = .vuv
      case "VND": self = .vnd
      case "XOF": self = .xof
      case "YER": self = .yer
      case "ZMW": self = .zmw
      case "BYN": self = .byn
      case "BYR": self = .byr
      case "DJF": self = .djf
      case "ERN": self = .ern
      case "FKP": self = .fkp
      case "GIP": self = .gip
      case "GNF": self = .gnf
      case "IRR": self = .irr
      case "KID": self = .kid
      case "LYD": self = .lyd
      case "MRU": self = .mru
      case "SLL": self = .sll
      case "SHP": self = .shp
      case "SOS": self = .sos
      case "STD": self = .std
      case "STN": self = .stn
      case "TJS": self = .tjs
      case "TOP": self = .top
      case "VED": self = .ved
      case "VEF": self = .vef
      case "VES": self = .ves
      case "XXX": self = .xxx
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .usd: return "USD"
      case .eur: return "EUR"
      case .gbp: return "GBP"
      case .cad: return "CAD"
      case .afn: return "AFN"
      case .all: return "ALL"
      case .dzd: return "DZD"
      case .aoa: return "AOA"
      case .ars: return "ARS"
      case .amd: return "AMD"
      case .awg: return "AWG"
      case .aud: return "AUD"
      case .bbd: return "BBD"
      case .azn: return "AZN"
      case .bdt: return "BDT"
      case .bsd: return "BSD"
      case .bhd: return "BHD"
      case .bif: return "BIF"
      case .bzd: return "BZD"
      case .bmd: return "BMD"
      case .btn: return "BTN"
      case .bam: return "BAM"
      case .brl: return "BRL"
      case .bob: return "BOB"
      case .bwp: return "BWP"
      case .bnd: return "BND"
      case .bgn: return "BGN"
      case .mmk: return "MMK"
      case .khr: return "KHR"
      case .cve: return "CVE"
      case .kyd: return "KYD"
      case .xaf: return "XAF"
      case .clp: return "CLP"
      case .cny: return "CNY"
      case .cop: return "COP"
      case .kmf: return "KMF"
      case .cdf: return "CDF"
      case .crc: return "CRC"
      case .hrk: return "HRK"
      case .czk: return "CZK"
      case .dkk: return "DKK"
      case .dop: return "DOP"
      case .xcd: return "XCD"
      case .egp: return "EGP"
      case .etb: return "ETB"
      case .xpf: return "XPF"
      case .fjd: return "FJD"
      case .gmd: return "GMD"
      case .ghs: return "GHS"
      case .gtq: return "GTQ"
      case .gyd: return "GYD"
      case .gel: return "GEL"
      case .htg: return "HTG"
      case .hnl: return "HNL"
      case .hkd: return "HKD"
      case .huf: return "HUF"
      case .isk: return "ISK"
      case .inr: return "INR"
      case .idr: return "IDR"
      case .ils: return "ILS"
      case .iqd: return "IQD"
      case .jmd: return "JMD"
      case .jpy: return "JPY"
      case .jep: return "JEP"
      case .jod: return "JOD"
      case .kzt: return "KZT"
      case .kes: return "KES"
      case .kwd: return "KWD"
      case .kgs: return "KGS"
      case .lak: return "LAK"
      case .lvl: return "LVL"
      case .lbp: return "LBP"
      case .lsl: return "LSL"
      case .lrd: return "LRD"
      case .ltl: return "LTL"
      case .mga: return "MGA"
      case .mkd: return "MKD"
      case .mop: return "MOP"
      case .mwk: return "MWK"
      case .mvr: return "MVR"
      case .mxn: return "MXN"
      case .myr: return "MYR"
      case .mur: return "MUR"
      case .mdl: return "MDL"
      case .mad: return "MAD"
      case .mnt: return "MNT"
      case .mzn: return "MZN"
      case .nad: return "NAD"
      case .npr: return "NPR"
      case .ang: return "ANG"
      case .nzd: return "NZD"
      case .nio: return "NIO"
      case .ngn: return "NGN"
      case .nok: return "NOK"
      case .omr: return "OMR"
      case .pab: return "PAB"
      case .pkr: return "PKR"
      case .pgk: return "PGK"
      case .pyg: return "PYG"
      case .pen: return "PEN"
      case .php: return "PHP"
      case .pln: return "PLN"
      case .qar: return "QAR"
      case .ron: return "RON"
      case .rub: return "RUB"
      case .rwf: return "RWF"
      case .wst: return "WST"
      case .sar: return "SAR"
      case .rsd: return "RSD"
      case .scr: return "SCR"
      case .sgd: return "SGD"
      case .sdg: return "SDG"
      case .syp: return "SYP"
      case .zar: return "ZAR"
      case .krw: return "KRW"
      case .ssp: return "SSP"
      case .sbd: return "SBD"
      case .lkr: return "LKR"
      case .srd: return "SRD"
      case .szl: return "SZL"
      case .sek: return "SEK"
      case .chf: return "CHF"
      case .twd: return "TWD"
      case .thb: return "THB"
      case .tzs: return "TZS"
      case .ttd: return "TTD"
      case .tnd: return "TND"
      case .try: return "TRY"
      case .tmt: return "TMT"
      case .ugx: return "UGX"
      case .uah: return "UAH"
      case .aed: return "AED"
      case .uyu: return "UYU"
      case .uzs: return "UZS"
      case .vuv: return "VUV"
      case .vnd: return "VND"
      case .xof: return "XOF"
      case .yer: return "YER"
      case .zmw: return "ZMW"
      case .byn: return "BYN"
      case .byr: return "BYR"
      case .djf: return "DJF"
      case .ern: return "ERN"
      case .fkp: return "FKP"
      case .gip: return "GIP"
      case .gnf: return "GNF"
      case .irr: return "IRR"
      case .kid: return "KID"
      case .lyd: return "LYD"
      case .mru: return "MRU"
      case .sll: return "SLL"
      case .shp: return "SHP"
      case .sos: return "SOS"
      case .std: return "STD"
      case .stn: return "STN"
      case .tjs: return "TJS"
      case .top: return "TOP"
      case .ved: return "VED"
      case .vef: return "VEF"
      case .ves: return "VES"
      case .xxx: return "XXX"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CurrencyCode, rhs: CurrencyCode) -> Bool {
    switch (lhs, rhs) {
      case (.usd, .usd): return true
      case (.eur, .eur): return true
      case (.gbp, .gbp): return true
      case (.cad, .cad): return true
      case (.afn, .afn): return true
      case (.all, .all): return true
      case (.dzd, .dzd): return true
      case (.aoa, .aoa): return true
      case (.ars, .ars): return true
      case (.amd, .amd): return true
      case (.awg, .awg): return true
      case (.aud, .aud): return true
      case (.bbd, .bbd): return true
      case (.azn, .azn): return true
      case (.bdt, .bdt): return true
      case (.bsd, .bsd): return true
      case (.bhd, .bhd): return true
      case (.bif, .bif): return true
      case (.bzd, .bzd): return true
      case (.bmd, .bmd): return true
      case (.btn, .btn): return true
      case (.bam, .bam): return true
      case (.brl, .brl): return true
      case (.bob, .bob): return true
      case (.bwp, .bwp): return true
      case (.bnd, .bnd): return true
      case (.bgn, .bgn): return true
      case (.mmk, .mmk): return true
      case (.khr, .khr): return true
      case (.cve, .cve): return true
      case (.kyd, .kyd): return true
      case (.xaf, .xaf): return true
      case (.clp, .clp): return true
      case (.cny, .cny): return true
      case (.cop, .cop): return true
      case (.kmf, .kmf): return true
      case (.cdf, .cdf): return true
      case (.crc, .crc): return true
      case (.hrk, .hrk): return true
      case (.czk, .czk): return true
      case (.dkk, .dkk): return true
      case (.dop, .dop): return true
      case (.xcd, .xcd): return true
      case (.egp, .egp): return true
      case (.etb, .etb): return true
      case (.xpf, .xpf): return true
      case (.fjd, .fjd): return true
      case (.gmd, .gmd): return true
      case (.ghs, .ghs): return true
      case (.gtq, .gtq): return true
      case (.gyd, .gyd): return true
      case (.gel, .gel): return true
      case (.htg, .htg): return true
      case (.hnl, .hnl): return true
      case (.hkd, .hkd): return true
      case (.huf, .huf): return true
      case (.isk, .isk): return true
      case (.inr, .inr): return true
      case (.idr, .idr): return true
      case (.ils, .ils): return true
      case (.iqd, .iqd): return true
      case (.jmd, .jmd): return true
      case (.jpy, .jpy): return true
      case (.jep, .jep): return true
      case (.jod, .jod): return true
      case (.kzt, .kzt): return true
      case (.kes, .kes): return true
      case (.kwd, .kwd): return true
      case (.kgs, .kgs): return true
      case (.lak, .lak): return true
      case (.lvl, .lvl): return true
      case (.lbp, .lbp): return true
      case (.lsl, .lsl): return true
      case (.lrd, .lrd): return true
      case (.ltl, .ltl): return true
      case (.mga, .mga): return true
      case (.mkd, .mkd): return true
      case (.mop, .mop): return true
      case (.mwk, .mwk): return true
      case (.mvr, .mvr): return true
      case (.mxn, .mxn): return true
      case (.myr, .myr): return true
      case (.mur, .mur): return true
      case (.mdl, .mdl): return true
      case (.mad, .mad): return true
      case (.mnt, .mnt): return true
      case (.mzn, .mzn): return true
      case (.nad, .nad): return true
      case (.npr, .npr): return true
      case (.ang, .ang): return true
      case (.nzd, .nzd): return true
      case (.nio, .nio): return true
      case (.ngn, .ngn): return true
      case (.nok, .nok): return true
      case (.omr, .omr): return true
      case (.pab, .pab): return true
      case (.pkr, .pkr): return true
      case (.pgk, .pgk): return true
      case (.pyg, .pyg): return true
      case (.pen, .pen): return true
      case (.php, .php): return true
      case (.pln, .pln): return true
      case (.qar, .qar): return true
      case (.ron, .ron): return true
      case (.rub, .rub): return true
      case (.rwf, .rwf): return true
      case (.wst, .wst): return true
      case (.sar, .sar): return true
      case (.rsd, .rsd): return true
      case (.scr, .scr): return true
      case (.sgd, .sgd): return true
      case (.sdg, .sdg): return true
      case (.syp, .syp): return true
      case (.zar, .zar): return true
      case (.krw, .krw): return true
      case (.ssp, .ssp): return true
      case (.sbd, .sbd): return true
      case (.lkr, .lkr): return true
      case (.srd, .srd): return true
      case (.szl, .szl): return true
      case (.sek, .sek): return true
      case (.chf, .chf): return true
      case (.twd, .twd): return true
      case (.thb, .thb): return true
      case (.tzs, .tzs): return true
      case (.ttd, .ttd): return true
      case (.tnd, .tnd): return true
      case (.try, .try): return true
      case (.tmt, .tmt): return true
      case (.ugx, .ugx): return true
      case (.uah, .uah): return true
      case (.aed, .aed): return true
      case (.uyu, .uyu): return true
      case (.uzs, .uzs): return true
      case (.vuv, .vuv): return true
      case (.vnd, .vnd): return true
      case (.xof, .xof): return true
      case (.yer, .yer): return true
      case (.zmw, .zmw): return true
      case (.byn, .byn): return true
      case (.byr, .byr): return true
      case (.djf, .djf): return true
      case (.ern, .ern): return true
      case (.fkp, .fkp): return true
      case (.gip, .gip): return true
      case (.gnf, .gnf): return true
      case (.irr, .irr): return true
      case (.kid, .kid): return true
      case (.lyd, .lyd): return true
      case (.mru, .mru): return true
      case (.sll, .sll): return true
      case (.shp, .shp): return true
      case (.sos, .sos): return true
      case (.std, .std): return true
      case (.stn, .stn): return true
      case (.tjs, .tjs): return true
      case (.top, .top): return true
      case (.ved, .ved): return true
      case (.vef, .vef): return true
      case (.ves, .ves): return true
      case (.xxx, .xxx): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CurrencyCode] {
    return [
      .usd,
      .eur,
      .gbp,
      .cad,
      .afn,
      .all,
      .dzd,
      .aoa,
      .ars,
      .amd,
      .awg,
      .aud,
      .bbd,
      .azn,
      .bdt,
      .bsd,
      .bhd,
      .bif,
      .bzd,
      .bmd,
      .btn,
      .bam,
      .brl,
      .bob,
      .bwp,
      .bnd,
      .bgn,
      .mmk,
      .khr,
      .cve,
      .kyd,
      .xaf,
      .clp,
      .cny,
      .cop,
      .kmf,
      .cdf,
      .crc,
      .hrk,
      .czk,
      .dkk,
      .dop,
      .xcd,
      .egp,
      .etb,
      .xpf,
      .fjd,
      .gmd,
      .ghs,
      .gtq,
      .gyd,
      .gel,
      .htg,
      .hnl,
      .hkd,
      .huf,
      .isk,
      .inr,
      .idr,
      .ils,
      .iqd,
      .jmd,
      .jpy,
      .jep,
      .jod,
      .kzt,
      .kes,
      .kwd,
      .kgs,
      .lak,
      .lvl,
      .lbp,
      .lsl,
      .lrd,
      .ltl,
      .mga,
      .mkd,
      .mop,
      .mwk,
      .mvr,
      .mxn,
      .myr,
      .mur,
      .mdl,
      .mad,
      .mnt,
      .mzn,
      .nad,
      .npr,
      .ang,
      .nzd,
      .nio,
      .ngn,
      .nok,
      .omr,
      .pab,
      .pkr,
      .pgk,
      .pyg,
      .pen,
      .php,
      .pln,
      .qar,
      .ron,
      .rub,
      .rwf,
      .wst,
      .sar,
      .rsd,
      .scr,
      .sgd,
      .sdg,
      .syp,
      .zar,
      .krw,
      .ssp,
      .sbd,
      .lkr,
      .srd,
      .szl,
      .sek,
      .chf,
      .twd,
      .thb,
      .tzs,
      .ttd,
      .tnd,
      .try,
      .tmt,
      .ugx,
      .uah,
      .aed,
      .uyu,
      .uzs,
      .vuv,
      .vnd,
      .xof,
      .yer,
      .zmw,
      .byn,
      .byr,
      .djf,
      .ern,
      .fkp,
      .gip,
      .gnf,
      .irr,
      .kid,
      .lyd,
      .mru,
      .sll,
      .shp,
      .sos,
      .std,
      .stn,
      .tjs,
      .top,
      .ved,
      .vef,
      .ves,
      .xxx,
    ]
  }
}

/// The input fields to create a new customer.
public struct CustomerCreateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - firstName: The customer’s first name.
  ///   - lastName: The customer’s last name.
  ///   - email: The customer’s email.
  ///   - phone: A unique phone number for the customer.
  /// 
  /// Formatted using E.164 standard. For example, _+16135551111_.
  ///   - password: The login password used by the customer.
  ///   - acceptsMarketing: Indicates whether the customer has consented to be sent marketing material via email.
  public init(firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, email: String, phone: Swift.Optional<String?> = nil, password: String, acceptsMarketing: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["firstName": firstName, "lastName": lastName, "email": email, "phone": phone, "password": password, "acceptsMarketing": acceptsMarketing]
  }

  /// The customer’s first name.
  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  /// The customer’s last name.
  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  /// The customer’s email.
  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  /// A unique phone number for the customer.
  /// 
  /// Formatted using E.164 standard. For example, _+16135551111_.
  public var phone: Swift.Optional<String?> {
    get {
      return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phone")
    }
  }

  /// The login password used by the customer.
  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  /// Indicates whether the customer has consented to be sent marketing material via email.
  public var acceptsMarketing: Swift.Optional<Bool?> {
    get {
      return graphQLMap["acceptsMarketing"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "acceptsMarketing")
    }
  }
}

/// Possible error codes that can be returned by `CustomerUserError`.
public enum CustomerErrorCode: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// The input value is blank.
  case blank
  /// The input value is invalid.
  case invalid
  /// The input value is already taken.
  case taken
  /// The input value is too long.
  case tooLong
  /// The input value is too short.
  case tooShort
  /// Unidentified customer.
  case unidentifiedCustomer
  /// Customer is disabled.
  case customerDisabled
  /// Input password starts or ends with whitespace.
  case passwordStartsOrEndsWithWhitespace
  /// Input contains HTML tags.
  case containsHtmlTags
  /// Input contains URL.
  case containsUrl
  /// Invalid activation token.
  case tokenInvalid
  /// Customer already enabled.
  case alreadyEnabled
  /// Address does not exist.
  case notFound
  /// Input email contains an invalid domain name.
  case badDomain
  /// Multipass token is not valid.
  case invalidMultipassRequest
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BLANK": self = .blank
      case "INVALID": self = .invalid
      case "TAKEN": self = .taken
      case "TOO_LONG": self = .tooLong
      case "TOO_SHORT": self = .tooShort
      case "UNIDENTIFIED_CUSTOMER": self = .unidentifiedCustomer
      case "CUSTOMER_DISABLED": self = .customerDisabled
      case "PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE": self = .passwordStartsOrEndsWithWhitespace
      case "CONTAINS_HTML_TAGS": self = .containsHtmlTags
      case "CONTAINS_URL": self = .containsUrl
      case "TOKEN_INVALID": self = .tokenInvalid
      case "ALREADY_ENABLED": self = .alreadyEnabled
      case "NOT_FOUND": self = .notFound
      case "BAD_DOMAIN": self = .badDomain
      case "INVALID_MULTIPASS_REQUEST": self = .invalidMultipassRequest
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .blank: return "BLANK"
      case .invalid: return "INVALID"
      case .taken: return "TAKEN"
      case .tooLong: return "TOO_LONG"
      case .tooShort: return "TOO_SHORT"
      case .unidentifiedCustomer: return "UNIDENTIFIED_CUSTOMER"
      case .customerDisabled: return "CUSTOMER_DISABLED"
      case .passwordStartsOrEndsWithWhitespace: return "PASSWORD_STARTS_OR_ENDS_WITH_WHITESPACE"
      case .containsHtmlTags: return "CONTAINS_HTML_TAGS"
      case .containsUrl: return "CONTAINS_URL"
      case .tokenInvalid: return "TOKEN_INVALID"
      case .alreadyEnabled: return "ALREADY_ENABLED"
      case .notFound: return "NOT_FOUND"
      case .badDomain: return "BAD_DOMAIN"
      case .invalidMultipassRequest: return "INVALID_MULTIPASS_REQUEST"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CustomerErrorCode, rhs: CustomerErrorCode) -> Bool {
    switch (lhs, rhs) {
      case (.blank, .blank): return true
      case (.invalid, .invalid): return true
      case (.taken, .taken): return true
      case (.tooLong, .tooLong): return true
      case (.tooShort, .tooShort): return true
      case (.unidentifiedCustomer, .unidentifiedCustomer): return true
      case (.customerDisabled, .customerDisabled): return true
      case (.passwordStartsOrEndsWithWhitespace, .passwordStartsOrEndsWithWhitespace): return true
      case (.containsHtmlTags, .containsHtmlTags): return true
      case (.containsUrl, .containsUrl): return true
      case (.tokenInvalid, .tokenInvalid): return true
      case (.alreadyEnabled, .alreadyEnabled): return true
      case (.notFound, .notFound): return true
      case (.badDomain, .badDomain): return true
      case (.invalidMultipassRequest, .invalidMultipassRequest): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CustomerErrorCode] {
    return [
      .blank,
      .invalid,
      .taken,
      .tooLong,
      .tooShort,
      .unidentifiedCustomer,
      .customerDisabled,
      .passwordStartsOrEndsWithWhitespace,
      .containsHtmlTags,
      .containsUrl,
      .tokenInvalid,
      .alreadyEnabled,
      .notFound,
      .badDomain,
      .invalidMultipassRequest,
    ]
  }
}

public final class GetCollectionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getCollections {
      collections(first: 2) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            products(first: 5) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  id
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "getCollections"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("collections", arguments: ["first": 2], type: .nonNull(.object(Collection.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(collections: Collection) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "collections": collections.resultMap])
    }

    /// List of the shop’s collections.
    public var collections: Collection {
      get {
        return Collection(unsafeResultMap: resultMap["collections"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "collections")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CollectionConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "CollectionConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CollectionEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "CollectionEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of CollectionEdge.
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Collection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("products", arguments: ["first": 5], type: .nonNull(.object(Product.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, products: Product) {
            self.init(unsafeResultMap: ["__typename": "Collection", "id": id, "products": products.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A globally-unique ID.
          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// List of products in the collection.
          public var products: Product {
            get {
              return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "products")
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(edges: [Edge]) {
              self.init(unsafeResultMap: ["__typename": "ProductConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of edges.
            public var edges: [Edge] {
              get {
                return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .nonNull(.object(Node.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node) {
                self.init(unsafeResultMap: ["__typename": "ProductEdge", "node": node.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of ProductEdge.
              public var node: Node {
                get {
                  return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Product"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID) {
                  self.init(unsafeResultMap: ["__typename": "Product", "id": id])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// A globally-unique ID.
                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class ProductQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ProductQuery($productId: ID, $imageFirst: Int, $variantsFirst: Int) {
      product(id: $productId) {
        __typename
        id
        title
        description
        productType
        vendor
        options {
          __typename
          name
          values
        }
        variants(first: $variantsFirst) {
          __typename
          edges {
            __typename
            node {
              __typename
              id
              title
              price {
                __typename
                amount
                currencyCode
              }
              availableForSale
            }
          }
        }
        featuredImage {
          __typename
          id
          url
        }
        images(first: $imageFirst) {
          __typename
          edges {
            __typename
            node {
              __typename
              id
              url
            }
          }
        }
      }
    }
    """

  public let operationName: String = "ProductQuery"

  public var productId: GraphQLID?
  public var imageFirst: Int?
  public var variantsFirst: Int?

  public init(productId: GraphQLID? = nil, imageFirst: Int? = nil, variantsFirst: Int? = nil) {
    self.productId = productId
    self.imageFirst = imageFirst
    self.variantsFirst = variantsFirst
  }

  public var variables: GraphQLMap? {
    return ["productId": productId, "imageFirst": imageFirst, "variantsFirst": variantsFirst]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("product", arguments: ["id": GraphQLVariable("productId")], type: .object(Product.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product? = nil) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }])
    }

    /// Fetch a specific `Product` by one of its unique attributes.
    public var product: Product? {
      get {
        return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("productType", type: .nonNull(.scalar(String.self))),
          GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
          GraphQLField("options", type: .nonNull(.list(.nonNull(.object(Option.selections))))),
          GraphQLField("variants", arguments: ["first": GraphQLVariable("variantsFirst")], type: .nonNull(.object(Variant.selections))),
          GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
          GraphQLField("images", arguments: ["first": GraphQLVariable("imageFirst")], type: .nonNull(.object(Image.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, description: String, productType: String, vendor: String, options: [Option], variants: Variant, featuredImage: FeaturedImage? = nil, images: Image) {
        self.init(unsafeResultMap: ["__typename": "Product", "id": id, "title": title, "description": description, "productType": productType, "vendor": vendor, "options": options.map { (value: Option) -> ResultMap in value.resultMap }, "variants": variants.resultMap, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }, "images": images.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A globally-unique ID.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The product’s title.
      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// Stripped description of the product, single line with HTML tags removed.
      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// A categorization that a product can be tagged with, commonly used for filtering and searching.
      public var productType: String {
        get {
          return resultMap["productType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "productType")
        }
      }

      /// The product’s vendor name.
      public var vendor: String {
        get {
          return resultMap["vendor"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "vendor")
        }
      }

      /// List of product options.
      public var options: [Option] {
        get {
          return (resultMap["options"] as! [ResultMap]).map { (value: ResultMap) -> Option in Option(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Option) -> ResultMap in value.resultMap }, forKey: "options")
        }
      }

      /// List of the product’s variants.
      public var variants: Variant {
        get {
          return Variant(unsafeResultMap: resultMap["variants"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "variants")
        }
      }

      /// The featured image for the product.
      /// 
      /// This field is functionally equivalent to `images(first: 1)`.
      public var featuredImage: FeaturedImage? {
        get {
          return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
        }
      }

      /// List of images associated with the product.
      public var images: Image {
        get {
          return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "images")
        }
      }

      public struct Option: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductOption"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("values", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, values: [String]) {
          self.init(unsafeResultMap: ["__typename": "ProductOption", "name": name, "values": values])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The product option’s name.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The corresponding value to the product option name.
        public var values: [String] {
          get {
            return resultMap["values"]! as! [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "values")
          }
        }
      }

      public struct Variant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductVariantConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "ProductVariantConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductVariantEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .nonNull(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node) {
            self.init(unsafeResultMap: ["__typename": "ProductVariantEdge", "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of ProductVariantEdge.
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductVariant"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("price", type: .nonNull(.object(Price.selections))),
                GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, title: String, price: Price, availableForSale: Bool) {
              self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "title": title, "price": price.resultMap, "availableForSale": availableForSale])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A globally-unique ID.
            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The product variant’s title.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// The product variant’s price.
            public var price: Price {
              get {
                return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "price")
              }
            }

            /// Indicates if the product variant is available for sale.
            public var availableForSale: Bool {
              get {
                return resultMap["availableForSale"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "availableForSale")
              }
            }

            public struct Price: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MoneyV2"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                  GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(amount: String, currencyCode: CurrencyCode) {
                self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Decimal money amount.
              public var amount: String {
                get {
                  return resultMap["amount"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "amount")
                }
              }

              /// Currency of the money.
              public var currencyCode: CurrencyCode {
                get {
                  return resultMap["currencyCode"]! as! CurrencyCode
                }
                set {
                  resultMap.updateValue(newValue, forKey: "currencyCode")
                }
              }
            }
          }
        }
      }

      public struct FeaturedImage: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Image"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, url: String) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A unique ID for the image.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The location of the image as a URL.
        /// 
        /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
        /// 
        /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
        /// 
        /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ImageConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge]) {
          self.init(unsafeResultMap: ["__typename": "ImageConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge] {
          get {
            return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ImageEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .nonNull(.object(Node.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node) {
            self.init(unsafeResultMap: ["__typename": "ImageEdge", "node": node.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of ImageEdge.
          public var node: Node {
            get {
              return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Image"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(GraphQLID.self)),
                GraphQLField("url", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID? = nil, url: String) {
              self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A unique ID for the image.
            public var id: GraphQLID? {
              get {
                return resultMap["id"] as? GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The location of the image as a URL.
            /// 
            /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
            /// 
            /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
            /// 
            /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }
          }
        }
      }
    }
  }
}

public final class ProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Products($first: Int, $imageFirst: Int, $variantsFirst: Int) {
      products(first: $first) {
        __typename
        nodes {
          __typename
          id
          title
          description
          productType
          vendor
          options {
            __typename
            name
            values
          }
          variants(first: $variantsFirst) {
            __typename
            edges {
              __typename
              node {
                __typename
                id
                title
                price {
                  __typename
                  amount
                  currencyCode
                }
                availableForSale
              }
            }
          }
          featuredImage {
            __typename
            id
            url
          }
          images(first: $imageFirst) {
            __typename
            edges {
              __typename
              node {
                __typename
                id
                url
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "Products"

  public var first: Int?
  public var imageFirst: Int?
  public var variantsFirst: Int?

  public init(first: Int? = nil, imageFirst: Int? = nil, variantsFirst: Int? = nil) {
    self.first = first
    self.imageFirst = imageFirst
    self.variantsFirst = variantsFirst
  }

  public var variables: GraphQLMap? {
    return ["first": first, "imageFirst": imageFirst, "variantsFirst": variantsFirst]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["QueryRoot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("products", arguments: ["first": GraphQLVariable("first")], type: .nonNull(.object(Product.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: Product) {
      self.init(unsafeResultMap: ["__typename": "QueryRoot", "products": products.resultMap])
    }

    /// List of the shop’s products.
    public var products: Product {
      get {
        return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node]) {
        self.init(unsafeResultMap: ["__typename": "ProductConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of the nodes contained in ProductEdge.
      public var nodes: [Node] {
        get {
          return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("productType", type: .nonNull(.scalar(String.self))),
            GraphQLField("vendor", type: .nonNull(.scalar(String.self))),
            GraphQLField("options", type: .nonNull(.list(.nonNull(.object(Option.selections))))),
            GraphQLField("variants", arguments: ["first": GraphQLVariable("variantsFirst")], type: .nonNull(.object(Variant.selections))),
            GraphQLField("featuredImage", type: .object(FeaturedImage.selections)),
            GraphQLField("images", arguments: ["first": GraphQLVariable("imageFirst")], type: .nonNull(.object(Image.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String, description: String, productType: String, vendor: String, options: [Option], variants: Variant, featuredImage: FeaturedImage? = nil, images: Image) {
          self.init(unsafeResultMap: ["__typename": "Product", "id": id, "title": title, "description": description, "productType": productType, "vendor": vendor, "options": options.map { (value: Option) -> ResultMap in value.resultMap }, "variants": variants.resultMap, "featuredImage": featuredImage.flatMap { (value: FeaturedImage) -> ResultMap in value.resultMap }, "images": images.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A globally-unique ID.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The product’s title.
        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// Stripped description of the product, single line with HTML tags removed.
        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// A categorization that a product can be tagged with, commonly used for filtering and searching.
        public var productType: String {
          get {
            return resultMap["productType"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "productType")
          }
        }

        /// The product’s vendor name.
        public var vendor: String {
          get {
            return resultMap["vendor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "vendor")
          }
        }

        /// List of product options.
        public var options: [Option] {
          get {
            return (resultMap["options"] as! [ResultMap]).map { (value: ResultMap) -> Option in Option(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Option) -> ResultMap in value.resultMap }, forKey: "options")
          }
        }

        /// List of the product’s variants.
        public var variants: Variant {
          get {
            return Variant(unsafeResultMap: resultMap["variants"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "variants")
          }
        }

        /// The featured image for the product.
        /// 
        /// This field is functionally equivalent to `images(first: 1)`.
        public var featuredImage: FeaturedImage? {
          get {
            return (resultMap["featuredImage"] as? ResultMap).flatMap { FeaturedImage(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "featuredImage")
          }
        }

        /// List of images associated with the product.
        public var images: Image {
          get {
            return Image(unsafeResultMap: resultMap["images"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "images")
          }
        }

        public struct Option: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductOption"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("values", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, values: [String]) {
            self.init(unsafeResultMap: ["__typename": "ProductOption", "name": name, "values": values])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The product option’s name.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The corresponding value to the product option name.
          public var values: [String] {
            get {
              return resultMap["values"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "values")
            }
          }
        }

        public struct Variant: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductVariantConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge]) {
            self.init(unsafeResultMap: ["__typename": "ProductVariantConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge] {
            get {
              return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductVariantEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "ProductVariantEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The item at the end of ProductVariantEdge.
            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProductVariant"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  GraphQLField("title", type: .nonNull(.scalar(String.self))),
                  GraphQLField("price", type: .nonNull(.object(Price.selections))),
                  GraphQLField("availableForSale", type: .nonNull(.scalar(Bool.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID, title: String, price: Price, availableForSale: Bool) {
                self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "title": title, "price": price.resultMap, "availableForSale": availableForSale])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A globally-unique ID.
              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The product variant’s title.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              /// The product variant’s price.
              public var price: Price {
                get {
                  return Price(unsafeResultMap: resultMap["price"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "price")
                }
              }

              /// Indicates if the product variant is available for sale.
              public var availableForSale: Bool {
                get {
                  return resultMap["availableForSale"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "availableForSale")
                }
              }

              public struct Price: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MoneyV2"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("amount", type: .nonNull(.scalar(String.self))),
                    GraphQLField("currencyCode", type: .nonNull(.scalar(CurrencyCode.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(amount: String, currencyCode: CurrencyCode) {
                  self.init(unsafeResultMap: ["__typename": "MoneyV2", "amount": amount, "currencyCode": currencyCode])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Decimal money amount.
                public var amount: String {
                  get {
                    return resultMap["amount"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "amount")
                  }
                }

                /// Currency of the money.
                public var currencyCode: CurrencyCode {
                  get {
                    return resultMap["currencyCode"]! as! CurrencyCode
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "currencyCode")
                  }
                }
              }
            }
          }
        }

        public struct FeaturedImage: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Image"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, url: String) {
            self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A unique ID for the image.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The location of the image as a URL.
          /// 
          /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
          /// 
          /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
          /// 
          /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ImageConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge]) {
            self.init(unsafeResultMap: ["__typename": "ImageConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge] {
            get {
              return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ImageEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "ImageEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The item at the end of ImageEdge.
            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Image"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .scalar(GraphQLID.self)),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(id: GraphQLID? = nil, url: String) {
                self.init(unsafeResultMap: ["__typename": "Image", "id": id, "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A unique ID for the image.
              public var id: GraphQLID? {
                get {
                  return resultMap["id"] as? GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }

              /// The location of the image as a URL.
              /// 
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              /// 
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              /// 
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class CustomerCreateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CustomerCreate($input: CustomerCreateInput!) {
      customerCreate(input: $input) {
        __typename
        customer {
          __typename
          id
          displayName
          email
          phone
        }
        customerUserErrors {
          __typename
          code
          field
          message
        }
      }
    }
    """

  public let operationName: String = "CustomerCreate"

  public var input: CustomerCreateInput

  public init(input: CustomerCreateInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("customerCreate", arguments: ["input": GraphQLVariable("input")], type: .object(CustomerCreate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(customerCreate: CustomerCreate? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "customerCreate": customerCreate.flatMap { (value: CustomerCreate) -> ResultMap in value.resultMap }])
    }

    /// Creates a new customer.
    public var customerCreate: CustomerCreate? {
      get {
        return (resultMap["customerCreate"] as? ResultMap).flatMap { CustomerCreate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "customerCreate")
      }
    }

    public struct CustomerCreate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CustomerCreatePayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("customer", type: .object(Customer.selections)),
          GraphQLField("customerUserErrors", type: .nonNull(.list(.nonNull(.object(CustomerUserError.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(customer: Customer? = nil, customerUserErrors: [CustomerUserError]) {
        self.init(unsafeResultMap: ["__typename": "CustomerCreatePayload", "customer": customer.flatMap { (value: Customer) -> ResultMap in value.resultMap }, "customerUserErrors": customerUserErrors.map { (value: CustomerUserError) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The created customer object.
      public var customer: Customer? {
        get {
          return (resultMap["customer"] as? ResultMap).flatMap { Customer(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "customer")
        }
      }

      /// The list of errors that occurred from executing the mutation.
      public var customerUserErrors: [CustomerUserError] {
        get {
          return (resultMap["customerUserErrors"] as! [ResultMap]).map { (value: ResultMap) -> CustomerUserError in CustomerUserError(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: CustomerUserError) -> ResultMap in value.resultMap }, forKey: "customerUserErrors")
        }
      }

      public struct Customer: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Customer"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("phone", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, displayName: String, email: String? = nil, phone: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Customer", "id": id, "displayName": displayName, "email": email, "phone": phone])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A unique ID for the customer.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The customer’s name, email or phone number.
        public var displayName: String {
          get {
            return resultMap["displayName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "displayName")
          }
        }

        /// The customer’s email address.
        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        /// The customer’s phone number.
        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }
      }

      public struct CustomerUserError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CustomerUserError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("code", type: .scalar(CustomerErrorCode.self)),
            GraphQLField("field", type: .list(.nonNull(.scalar(String.self)))),
            GraphQLField("message", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(code: CustomerErrorCode? = nil, field: [String]? = nil, message: String) {
          self.init(unsafeResultMap: ["__typename": "CustomerUserError", "code": code, "field": field, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The error code.
        public var code: CustomerErrorCode? {
          get {
            return resultMap["code"] as? CustomerErrorCode
          }
          set {
            resultMap.updateValue(newValue, forKey: "code")
          }
        }

        /// The path to the input field that caused the error.
        public var field: [String]? {
          get {
            return resultMap["field"] as? [String]
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }

        /// The error message.
        public var message: String {
          get {
            return resultMap["message"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}
