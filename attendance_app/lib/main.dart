import 'package:attendanceapp/screens/screen1.dart';
import 'package:attendanceapp/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:url_launcher/url_launcher.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

void main() => runApp(MaterialApp(
      title: 'AttendanceApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hoverColor: Colors.indigoAccent.shade100,
        accentColor: Colors.indigoAccent.shade100,
        dividerColor: Colors.indigoAccent.shade100,
        highlightColor: Colors.indigoAccent.shade100,
        primarySwatch: Colors.indigo,
      ),
      home: SignInDemo(),
    ));

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;

  DatabaseHelper dbhelper = DatabaseHelper();

  static Database _database; // Singleton Database

  String noteTable; //Table Name

  String colSNo = 'SNo';

  String colCollege = 'College';

  String colCourseDegree = 'CourseDegree';

  String colSemester = 'Semester';

  String colDepartment = 'Department';

  String colSection = 'Section';

  String colSubject = 'Subject';

  String colTeacher = 'Teacher';

  String colPassoutYear = 'PassoutYear';

  String colStudentID = 'StudentID';

  String colUniversityROLL = 'UniversityROLL';

  String colClassROLL = 'ClassROLL';

  String colName = 'Name';

  String colTotalAttendance = 'TotalAttendance';

  String colPresentDays = 'PresentDays';

  String colAttendancePercent = 'AttendancePercent';

  String colDay1 = 'Day1';
  String colDay2 = 'Day2';
  String colDay3 = 'Day3';
  String colDay4 = 'Day4';
  String colDay5 = 'Day5';
  String colDay6 = 'Day6';
  String colDay7 = 'Day7';
  String colDay8 = 'Day8';
  String colDay9 = 'Day9';
  String colDay10 = 'Day10';
  String colDay11 = 'Day11';
  String colDay12 = 'Day12';
  String colDay13 = 'Day13';
  String colDay14 = 'Day14';
  String colDay15 = 'Day15';
  String colDay16 = 'Day16';
  String colDay17 = 'Day17';
  String colDay18 = 'Day18';
  String colDay19 = 'Day19';
  String colDay20 = 'Day20';
  String colDay21 = 'Day21';
  String colDay22 = 'Day22';
  String colDay23 = 'Day23';
  String colDay24 = 'Day24';
  String colDay25 = 'Day25';
  String colDay26 = 'Day26';
  String colDay27 = 'Day27';
  String colDay28 = 'Day28';
  String colDay29 = 'Day29';
  String colDay30 = 'Day30';
  String colDay31 = 'Day31';
  String colDay32 = 'Day32';
  String colDay33 = 'Day33';
  String colDay34 = 'Day34';
  String colDay35 = 'Day35';
  String colDay36 = 'Day36';
  String colDay37 = 'Day37';
  String colDay38 = 'Day38';
  String colDay39 = 'Day39';
  String colDay40 = 'Day40';
  String colDay41 = 'Day41';
  String colDay42 = 'Day42';
  String colDay43 = 'Day43';
  String colDay44 = 'Day44';
  String colDay45 = 'Day45';
  String colDay46 = 'Day46';
  String colDay47 = 'Day47';
  String colDay48 = 'Day48';
  String colDay49 = 'Day49';
  String colDay50 = 'Day50';
  String colDay51 = 'Day51';
  String colDay52 = 'Day52';
  String colDay53 = 'Day53';
  String colDay54 = 'Day54';
  String colDay55 = 'Day55';
  String colDay56 = 'Day56';
  String colDay57 = 'Day57';
  String colDay58 = 'Day58';
  String colDay59 = 'Day59';
  String colDay60 = 'Day60';
  String colDay61 = 'Day61';
  String colDay62 = 'Day62';
  String colDay63 = 'Day63';
  String colDay64 = 'Day64';
  String colDay65 = 'Day65';
  String colDay66 = 'Day66';
  String colDay67 = 'Day67';
  String colDay68 = 'Day68';
  String colDay69 = 'Day69';
  String colDay70 = 'Day70';
  String colDay71 = 'Day71';
  String colDay72 = 'Day72';
  String colDay73 = 'Day73';
  String colDay74 = 'Day74';
  String colDay75 = 'Day75';
  String colDay76 = 'Day76';
  String colDay77 = 'Day77';
  String colDay78 = 'Day78';
  String colDay79 = 'Day79';
  String colDay80 = 'Day80';
  String colDay81 = 'Day81';
  String colDay82 = 'Day82';
  String colDay83 = 'Day83';
  String colDay84 = 'Day84';
  String colDay85 = 'Day85';
  String colDay86 = 'Day86';
  String colDay87 = 'Day87';
  String colDay88 = 'Day88';
  String colDay89 = 'Day89';
  String colDay90 = 'Day90';
  String colDay91 = 'Day91';
  String colDay92 = 'Day92';
  String colDay93 = 'Day93';
  String colDay94 = 'Day94';
  String colDay95 = 'Day95';
  String colDay96 = 'Day96';
  String colDay97 = 'Day97';
  String colDay98 = 'Day98';
  String colDay99 = 'Day99';
  String colDay100 = 'Day100';
  String colDay101 = 'Day101';
  String colDay102 = 'Day102';
  String colDay103 = 'Day103';
  String colDay104 = 'Day104';
  String colDay105 = 'Day105';
  String colDay106 = 'Day106';
  String colDay107 = 'Day107';
  String colDay108 = 'Day108';
  String colDay109 = 'Day109';
  String colDay110 = 'Day110';
  String colDay111 = 'Day111';
  String colDay112 = 'Day112';
  String colDay113 = 'Day113';
  String colDay114 = 'Day114';
  String colDay115 = 'Day115';
  String colDay116 = 'Day116';
  String colDay117 = 'Day117';
  String colDay118 = 'Day118';
  String colDay119 = 'Day119';
  String colDay120 = 'Day120';
  String colDay121 = 'Day121';
  String colDay122 = 'Day122';
  String colDay123 = 'Day123';
  String colDay124 = 'Day124';
  String colDay125 = 'Day125';
  String colDay126 = 'Day126';
  String colDay127 = 'Day127';
  String colDay128 = 'Day128';
  String colDay129 = 'Day129';
  String colDay130 = 'Day130';
  String colDay131 = 'Day131';
  String colDay132 = 'Day132';
  String colDay133 = 'Day133';
  String colDay134 = 'Day134';
  String colDay135 = 'Day135';
  String colDay136 = 'Day136';
  String colDay137 = 'Day137';
  String colDay138 = 'Day138';
  String colDay139 = 'Day139';
  String colDay140 = 'Day140';
  String colDay141 = 'Day141';
  String colDay142 = 'Day142';
  String colDay143 = 'Day143';
  String colDay144 = 'Day144';
  String colDay145 = 'Day145';
  String colDay146 = 'Day146';
  String colDay147 = 'Day147';
  String colDay148 = 'Day148';
  String colDay149 = 'Day149';
  String colDay150 = 'Day150';

  //DropDowns
  var selectedCollege = "Netaji Subhash Engineering College";
  var colleges = ["Netaji Subhash Engineering College", "Others"];

  var selectedCourse = "BTech";
  var Course = [
    "BTech",
    "MTech",
    "BBA",
    "MBA",
    "BCA",
    "MCA",
    "PhD",
    "BSc",
    "DIPLOMA"
  ];

  var selectedSemester = "SEM_1st";
  var Semester = [
    "SEM_1st",
    "SEM_2nd",
    "SEM_3rd",
    "SEM_4th",
    "SEM_5th",
    "SEM_6th",
    "SEM_7th",
    "SEM_8th",
    "SEM_9th",
    "SEM_10th"
  ];

  var selectedDepartment = "CSE";
  var Department = [
    "CSE",
    "CSE+IT",
    "AEIE",
    "BME",
    "CE",
    "EE",
    "ECE",
    "IT",
    "ME",
    "CI",
    "PS",
    "DataScience",
    "CyberSecurity"
  ];

  var selectedSection = "A";
  var Section = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  var selectedSubject = "English";
  var finalSubject = "English";
  var Subject = [
    "English",
    "Physics",
    "Chemistry",
    "Biology",
    "ED",
    "Mathematics",
    "CA",
    "CO",
    "DSA",
    "DAA",
    "FLAT",
    "IT_Workshop",
    "Mech_Workshop",
    "AnalogDigital",
    "Others",
    "EVS",
    "Economics",
    "Signal_&_Systems",
    "CompilerDesign",
    "OS",
    "OOPs",
    "AI",
    "Adv_CA",
    "ComputerGraphics",
    "DBMS",
    "CloudComputing",
    "QuantumComputing",
  ];
  var formKey1 = GlobalKey<FormState>();
  var subjectTC = TextEditingController();
  bool subjectTextEnable = false;

  var passoutYears = [
    '1900',
    '1901',
    '1902',
    '1903',
    '1904',
    '1905',
    '1906',
    '1907',
    '1908',
    '1909',
    '1910',
    '1911',
    '1912',
    '1913',
    '1914',
    '1915',
    '1916',
    '1917',
    '1918',
    '1919',
    '1920',
    '1921',
    '1922',
    '1923',
    '1924',
    '1925',
    '1926',
    '1927',
    '1928',
    '1929',
    '1930',
    '1931',
    '1932',
    '1933',
    '1934',
    '1935',
    '1936',
    '1937',
    '1938',
    '1939',
    '1940',
    '1941',
    '1942',
    '1943',
    '1944',
    '1945',
    '1946',
    '1947',
    '1948',
    '1949',
    '1950',
    '1951',
    '1952',
    '1953',
    '1954',
    '1955',
    '1956',
    '1957',
    '1958',
    '1959',
    '1960',
    '1961',
    '1962',
    '1963',
    '1964',
    '1965',
    '1966',
    '1967',
    '1968',
    '1969',
    '1970',
    '1971',
    '1972',
    '1973',
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032',
    '2033',
    '2034',
    '2035',
    '2036',
    '2037',
    '2038',
    '2039',
    '2040',
    '2041',
    '2042',
    '2043',
    '2044',
    '2045',
    '2046',
    '2047',
    '2048',
    '2049',
    '2050',
    '2051',
    '2052',
    '2053',
    '2054',
    '2055',
    '2056',
    '2057',
    '2058',
    '2059',
    '2060',
    '2061',
    '2062',
    '2063',
    '2064',
    '2065',
    '2066',
    '2067',
    '2068',
    '2069',
    '2070',
    '2071',
    '2072',
    '2073',
    '2074',
    '2075',
    '2076',
    '2077',
    '2078',
    '2079',
    '2080',
    '2081',
    '2082',
    '2083',
    '2084',
    '2085',
    '2086',
    '2087',
    '2088',
    '2089',
    '2090',
    '2091',
    '2092',
    '2093',
    '2094',
    '2095',
    '2096',
    '2097',
    '2098',
    '2099',
    '2100',
    '2101',
    '2102',
    '2103',
    '2104',
    '2105',
    '2106',
    '2107',
    '2108',
    '2109',
    '2110',
    '2111',
    '2112',
    '2113',
    '2114',
    '2115',
    '2116',
    '2117',
    '2118',
    '2119',
    '2120',
    '2121',
    '2122',
    '2123',
    '2124',
    '2125',
    '2126',
    '2127',
    '2128',
    '2129',
    '2130',
    '2131',
    '2132',
    '2133',
    '2134',
    '2135',
    '2136',
    '2137',
    '2138',
    '2139',
    '2140',
    '2141',
    '2142',
    '2143',
    '2144',
    '2145',
    '2146',
    '2147',
    '2148',
    '2149',
    '2150',
    '2151',
    '2152',
    '2153',
    '2154',
    '2155',
    '2156',
    '2157',
    '2158',
    '2159',
    '2160',
    '2161',
    '2162',
    '2163',
    '2164',
    '2165',
    '2166',
    '2167',
    '2168',
    '2169',
    '2170',
    '2171',
    '2172',
    '2173',
    '2174',
    '2175',
    '2176',
    '2177',
    '2178',
    '2179',
    '2180',
    '2181',
    '2182',
    '2183',
    '2184',
    '2185',
    '2186',
    '2187',
    '2188',
    '2189',
    '2190',
    '2191',
    '2192',
    '2193',
    '2194',
    '2195',
    '2196',
    '2197',
    '2198',
    '2199',
    '2200',
    '2201',
    '2202',
    '2203',
    '2204',
    '2205',
    '2206',
    '2207',
    '2208',
    '2209',
    '2210',
    '2211',
    '2212',
    '2213',
    '2214',
    '2215',
    '2216',
    '2217',
    '2218',
    '2219',
    '2220',
    '2221',
    '2222',
    '2223',
    '2224',
    '2225',
    '2226',
    '2227',
    '2228',
    '2229',
    '2230',
    '2231',
    '2232',
    '2233',
    '2234',
    '2235',
    '2236',
    '2237',
    '2238',
    '2239',
    '2240',
    '2241',
    '2242',
    '2243',
    '2244',
    '2245',
    '2246',
    '2247',
    '2248',
    '2249',
    '2250',
    '2251',
    '2252',
    '2253',
    '2254',
    '2255',
    '2256',
    '2257',
    '2258',
    '2259',
    '2260',
    '2261',
    '2262',
    '2263',
    '2264',
    '2265',
    '2266',
    '2267',
    '2268',
    '2269',
    '2270',
    '2271',
    '2272',
    '2273',
    '2274',
    '2275',
    '2276',
    '2277',
    '2278',
    '2279',
    '2280',
    '2281',
    '2282',
    '2283',
    '2284',
    '2285',
    '2286',
    '2287',
    '2288',
    '2289',
    '2290',
    '2291',
    '2292',
    '2293',
    '2294',
    '2295',
    '2296',
    '2297',
    '2298',
    '2299',
    '2300',
    '2301',
    '2302',
    '2303',
    '2304',
    '2305',
    '2306',
    '2307',
    '2308',
    '2309',
    '2310',
    '2311',
    '2312',
    '2313',
    '2314',
    '2315',
    '2316',
    '2317',
    '2318',
    '2319',
    '2320',
    '2321',
    '2322',
    '2323',
    '2324',
    '2325',
    '2326',
    '2327',
    '2328',
    '2329',
    '2330',
    '2331',
    '2332',
    '2333',
    '2334',
    '2335',
    '2336',
    '2337',
    '2338',
    '2339',
    '2340',
    '2341',
    '2342',
    '2343',
    '2344',
    '2345',
    '2346',
    '2347',
    '2348',
    '2349',
    '2350',
    '2351',
    '2352',
    '2353',
    '2354',
    '2355',
    '2356',
    '2357',
    '2358',
    '2359',
    '2360',
    '2361',
    '2362',
    '2363',
    '2364',
    '2365',
    '2366',
    '2367',
    '2368',
    '2369',
    '2370',
    '2371',
    '2372',
    '2373',
    '2374',
    '2375',
    '2376',
    '2377',
    '2378',
    '2379',
    '2380',
    '2381',
    '2382',
    '2383',
    '2384',
    '2385',
    '2386',
    '2387',
    '2388',
    '2389',
    '2390',
    '2391',
    '2392',
    '2393',
    '2394',
    '2395',
    '2396',
    '2397',
    '2398',
    '2399',
    '2400',
    '2401',
    '2402',
    '2403',
    '2404',
    '2405',
    '2406',
    '2407',
    '2408',
    '2409',
    '2410',
    '2411',
    '2412',
    '2413',
    '2414',
    '2415',
    '2416',
    '2417',
    '2418',
    '2419',
    '2420',
    '2421',
    '2422',
    '2423',
    '2424',
    '2425',
    '2426',
    '2427',
    '2428',
    '2429',
    '2430',
    '2431',
    '2432',
    '2433',
    '2434',
    '2435',
    '2436',
    '2437',
    '2438',
    '2439',
    '2440',
    '2441',
    '2442',
    '2443',
    '2444',
    '2445',
    '2446',
    '2447',
    '2448',
    '2449',
    '2450',
    '2451',
    '2452',
    '2453',
    '2454',
    '2455',
    '2456',
    '2457',
    '2458',
    '2459',
    '2460',
    '2461',
    '2462',
    '2463',
    '2464',
    '2465',
    '2466',
    '2467',
    '2468',
    '2469',
    '2470',
    '2471',
    '2472',
    '2473',
    '2474',
    '2475',
    '2476',
    '2477',
    '2478',
    '2479',
    '2480',
    '2481',
    '2482',
    '2483',
    '2484',
    '2485',
    '2486',
    '2487',
    '2488',
    '2489',
    '2490',
    '2491',
    '2492',
    '2493',
    '2494',
    '2495',
    '2496',
    '2497',
    '2498',
    '2499',
    '2500',
    '2501',
    '2502',
    '2503',
    '2504',
    '2505',
    '2506',
    '2507',
    '2508',
    '2509',
    '2510',
    '2511',
    '2512',
    '2513',
    '2514',
    '2515',
    '2516',
    '2517',
    '2518',
    '2519',
    '2520',
    '2521',
    '2522',
    '2523',
    '2524',
    '2525',
    '2526',
    '2527',
    '2528',
    '2529',
    '2530',
    '2531',
    '2532',
    '2533',
    '2534',
    '2535',
    '2536',
    '2537',
    '2538',
    '2539',
    '2540',
    '2541',
    '2542',
    '2543',
    '2544',
    '2545',
    '2546',
    '2547',
    '2548',
    '2549',
    '2550',
    '2551',
    '2552',
    '2553',
    '2554',
    '2555',
    '2556',
    '2557',
    '2558',
    '2559',
    '2560',
    '2561',
    '2562',
    '2563',
    '2564',
    '2565',
    '2566',
    '2567',
    '2568',
    '2569',
    '2570',
    '2571',
    '2572',
    '2573',
    '2574',
    '2575',
    '2576',
    '2577',
    '2578',
    '2579',
    '2580',
    '2581',
    '2582',
    '2583',
    '2584',
    '2585',
    '2586',
    '2587',
    '2588',
    '2589',
    '2590',
    '2591',
    '2592',
    '2593',
    '2594',
    '2595',
    '2596',
    '2597',
    '2598',
    '2599',
    '2600',
    '2601',
    '2602',
    '2603',
    '2604',
    '2605',
    '2606',
    '2607',
    '2608',
    '2609',
    '2610',
    '2611',
    '2612',
    '2613',
    '2614',
    '2615',
    '2616',
    '2617',
    '2618',
    '2619',
    '2620',
    '2621',
    '2622',
    '2623',
    '2624',
    '2625',
    '2626',
    '2627',
    '2628',
    '2629',
    '2630',
    '2631',
    '2632',
    '2633',
    '2634',
    '2635',
    '2636',
    '2637',
    '2638',
    '2639',
    '2640',
    '2641',
    '2642',
    '2643',
    '2644',
    '2645',
    '2646',
    '2647',
    '2648',
    '2649',
    '2650',
    '2651',
    '2652',
    '2653',
    '2654',
    '2655',
    '2656',
    '2657',
    '2658',
    '2659',
    '2660',
    '2661',
    '2662',
    '2663',
    '2664',
    '2665',
    '2666',
    '2667',
    '2668',
    '2669',
    '2670',
    '2671',
    '2672',
    '2673',
    '2674',
    '2675',
    '2676',
    '2677',
    '2678',
    '2679',
    '2680',
    '2681',
    '2682',
    '2683',
    '2684',
    '2685',
    '2686',
    '2687',
    '2688',
    '2689',
    '2690',
    '2691',
    '2692',
    '2693',
    '2694',
    '2695',
    '2696',
    '2697',
    '2698',
    '2699',
    '2700',
    '2701',
    '2702',
    '2703',
    '2704',
    '2705',
    '2706',
    '2707',
    '2708',
    '2709',
    '2710',
    '2711',
    '2712',
    '2713',
    '2714',
    '2715',
    '2716',
    '2717',
    '2718',
    '2719',
    '2720',
    '2721',
    '2722',
    '2723',
    '2724',
    '2725',
    '2726',
    '2727',
    '2728',
    '2729',
    '2730',
    '2731',
    '2732',
    '2733',
    '2734',
    '2735',
    '2736',
    '2737',
    '2738',
    '2739',
    '2740',
    '2741',
    '2742',
    '2743',
    '2744',
    '2745',
    '2746',
    '2747',
    '2748',
    '2749',
    '2750',
    '2751',
    '2752',
    '2753',
    '2754',
    '2755',
    '2756',
    '2757',
    '2758',
    '2759',
    '2760',
    '2761',
    '2762',
    '2763',
    '2764',
    '2765',
    '2766',
    '2767',
    '2768',
    '2769',
    '2770',
    '2771',
    '2772',
    '2773',
    '2774',
    '2775',
    '2776',
    '2777',
    '2778',
    '2779',
    '2780',
    '2781',
    '2782',
    '2783',
    '2784',
    '2785',
    '2786',
    '2787',
    '2788',
    '2789',
    '2790',
    '2791',
    '2792',
    '2793',
    '2794',
    '2795',
    '2796',
    '2797',
    '2798',
    '2799',
    '2800',
    '2801',
    '2802',
    '2803',
    '2804',
    '2805',
    '2806',
    '2807',
    '2808',
    '2809',
    '2810',
    '2811',
    '2812',
    '2813',
    '2814',
    '2815',
    '2816',
    '2817',
    '2818',
    '2819',
    '2820',
    '2821',
    '2822',
    '2823',
    '2824',
    '2825',
    '2826',
    '2827',
    '2828',
    '2829',
    '2830',
    '2831',
    '2832',
    '2833',
    '2834',
    '2835',
    '2836',
    '2837',
    '2838',
    '2839',
    '2840',
    '2841',
    '2842',
    '2843',
    '2844',
    '2845',
    '2846',
    '2847',
    '2848',
    '2849',
    '2850',
    '2851',
    '2852',
    '2853',
    '2854',
    '2855',
    '2856',
    '2857',
    '2858',
    '2859',
    '2860',
    '2861',
    '2862',
    '2863',
    '2864',
    '2865',
    '2866',
    '2867',
    '2868',
    '2869',
    '2870',
    '2871',
    '2872',
    '2873',
    '2874',
    '2875',
    '2876',
    '2877',
    '2878',
    '2879',
    '2880',
    '2881',
    '2882',
    '2883',
    '2884',
    '2885',
    '2886',
    '2887',
    '2888',
    '2889',
    '2890',
    '2891',
    '2892',
    '2893',
    '2894',
    '2895',
    '2896',
    '2897',
    '2898',
    '2899',
    '2900',
    '2901',
    '2902',
    '2903',
    '2904',
    '2905',
    '2906',
    '2907',
    '2908',
    '2909',
    '2910',
    '2911',
    '2912',
    '2913',
    '2914',
    '2915',
    '2916',
    '2917',
    '2918',
    '2919',
    '2920',
    '2921',
    '2922',
    '2923',
    '2924',
    '2925',
    '2926',
    '2927',
    '2928',
    '2929',
    '2930',
    '2931',
    '2932',
    '2933',
    '2934',
    '2935',
    '2936',
    '2937',
    '2938',
    '2939',
    '2940',
    '2941',
    '2942',
    '2943',
    '2944',
    '2945',
    '2946',
    '2947',
    '2948',
    '2949',
    '2950',
    '2951',
    '2952',
    '2953',
    '2954',
    '2955',
    '2956',
    '2957',
    '2958',
    '2959',
    '2960',
    '2961',
    '2962',
    '2963',
    '2964',
    '2965',
    '2966',
    '2967',
    '2968',
    '2969',
    '2970',
    '2971',
    '2972',
    '2973',
    '2974',
    '2975',
    '2976',
    '2977',
    '2978',
    '2979',
    '2980',
    '2981',
    '2982',
    '2983',
    '2984',
    '2985',
    '2986',
    '2987',
    '2988',
    '2989',
    '2990',
    '2991',
    '2992',
    '2993',
    '2994',
    '2995',
    '2996',
    '2997',
    '2998',
    '2999',
    '3000'
  ];

  //date time
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedYear =
      DateTime.parse("${DateTime.now().toLocal()}").year.toString();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();

    Department.sort();
    Course.sort();
    Subject.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: _buildBodyforAppDrawer()),
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
              child: ListTile(
                leading: Icon(
                  Icons.local_library,
                  size: 45,
                  color: Colors.indigo,
                ),
                title: Text(
                  "Attendance App",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle:
                    Text("Optimized for Educational Institutions & Colleges"),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.developer_mode,
                color: Colors.pink,
              ),
              trailing: Icon(
                Icons.android,
                color: Colors.greenAccent.shade700,
                size: 25,
              ),
              title: Text("Developer"),
              subtitle: Text(
                "Saurav Kumar",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Colors.pink,
              ),
              title: Text("Help/Support E-mail"),
              subtitle: Text("sauravkumar.cse2018@nsec.ac.in"),
            ),
            GestureDetector(
              onLongPress: () {
                _launchURL();
              },
              onTap: () {
                _launchURL();
              },
              child: ListTile(
                leading: Icon(
                  Icons.link,
                  color: Colors.pink,
                ),
                title: Text("Website"),
                subtitle: Text("https://attendanceapp.ml",
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.pink,
              ),
              title: Text("App Version"),
              subtitle: Text("Version 1.0.0"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.indigo.shade500,
          title: Text('Attendance App'),
          leading: IconButton(
            icon: Icon(Icons.local_library),
            iconSize: 30,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: IconButton(
                icon: Icon(Icons.apps),
                tooltip: "Open AppDrawer",
                iconSize: 27,
                color: Colors.white,
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.info_outline),
                tooltip: "About",
                iconSize: 27,
                color: Colors.white,
                onPressed: () {
                  help();
                },
              ),
            )
          ]),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return ListView(
//
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 1, 0, 1),
            color: Colors.amberAccent.shade100,
            child: Center(
              child: Text("Welcome, " + _currentUser.displayName,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 15)),
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
              'Attendance Details',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

//
//          Container(
//            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//            child: Text('Institution/College :',
//              style:TextStyle(fontSize: 15, color: Colors.deepPurple, fontWeight: FontWeight.bold),
//              textAlign: TextAlign.center,
//
//            ),),
          Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                "( " + selectedCollege + " )",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),

          Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: _currentUser,
                ),
                subtitle: Text(
                  _currentUser.displayName ?? '',
                  style: TextStyle(fontSize: 15, color: Colors.indigo),
                ),
                title: Text(
                  "Teacher's Name",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                ),
              )),
//Course
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Icon(Icons.school),
                ),
                Text(
                  'Course Degree:',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  items: Course.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    );
                  }).toList(),
                  value: selectedCourse,
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      selectedCourse = (valueSelectedByUser);
                    });
                  },
                ),
              ],
            ),
          ),

          //Semester

          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Icon(Icons.fiber_smart_record),
                ),
                Text(
                  'Semester :',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  items: Semester.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    );
                  }).toList(),
                  value: selectedSemester,
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      selectedSemester = (valueSelectedByUser);
                    });
                  },
                ),
              ],
            ),
          ),
//CEll 3

          //Department
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Icon(Icons.fiber_smart_record),
                ),
                Text(
                  'Department :',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  items: Department.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    );
                  }).toList(),
                  value: selectedDepartment,
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      selectedDepartment = (valueSelectedByUser);
                    });
                  },
                ),
              ],
            ),
          ),

          //Section
          //Department
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Icon(Icons.fiber_smart_record),
                ),
                Text(
                  'Group/Section :',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  items: Section.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    );
                  }).toList(),
                  value: selectedSection,
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      selectedSection = (valueSelectedByUser);
                    });
                  },
                ),
              ],
            ),
          ),

          //Subject
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Icon(Icons.book),
                ),
                Text(
                  'Subject :',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 3),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  items: Subject.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    );
                  }).toList(),
                  value: selectedSubject,
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      selectedSubject = (valueSelectedByUser);
                      finalSubject = (valueSelectedByUser);
                      if (valueSelectedByUser == "Others") {
                        subjectTextEnable = true;
                        finalSubject = subjectTC.text;
                      } else {
                        subjectTextEnable = false;
                        subjectTC.text = "";
                        finalSubject = (valueSelectedByUser);
                      }
                    });
                  },
                ),
              ],
            ),
          ),

          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Form(
                key: formKey1,
                child: TextFormField(
                  autovalidate: true,
                  enabled: subjectTextEnable,
                  enableSuggestions: true,
                  validator: (String val) {
                    if (val.isEmpty && selectedSubject == "Others")
                      return ("*Enter Subject first!");
                  },
                  controller: subjectTC,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.arrow_forward_ios),
                    fillColor: Colors.yellowAccent,
                    labelText: "Others Subject",
                    hintText: "Enter Subject (if Others selected)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  enableInteractiveSelection: true,
                  onChanged: (var userp) {
                    setState(() {
                      finalSubject = userp;
                      finalSubject = subjectTC.text;
                    });
                  },
                ),
              )),

          //YEAR picker CURRENT SESSION
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Icon(Icons.event),
                ),
                Text(
                  "Batch(PassOut Year): ",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.pink,
                  ),
                  items: passoutYears.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(fontSize: 17, color: Colors.indigo),
                      ),
                    );
                  }).toList(),
                  value: selectedYear,
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                      selectedYear = (valueSelectedByUser);
                    });
                  },
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 5),
          ),

          Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 5),
              child: RaisedButton.icon(
//                borderSide: BorderSide(color: Colors.pinkAccent.shade100, style: BorderStyle.solid),
                icon: Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 50,
                ),
                color: Colors.pinkAccent,
                elevation: 15,
                onPressed: () {
                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  if (formKey1.currentState.validate()) {
                    initializeDatabase();

                    gotoscreen1(
                        _currentUser,
                        _googleSignIn,
                        selectedCollege,
                        selectedCourse,
                        selectedSemester,
                        selectedDepartment,
                        finalSubject,
                        selectedYear,
                        [],
                        selectedSection);
                  }
                  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                },
                label: Text(
                  'NEXT  ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ],
      );
    } else {
      return ListView(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
            child: CircleAvatar(
                backgroundColor: Colors.yellow.shade100,
                radius: 100,
                child: Icon(
                  Icons.account_balance,
                  size: 150,
                  color: Colors.deepPurple,
                )),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              'Select Institution/College :',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 0, 15, 35),
              child: DropdownButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.pink,
                  size: 35,
                ),
                items: colleges.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(fontSize: 17, color: Colors.indigo),
                    ),
                  );
                }).toList(),
                value: selectedCollege,
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('User selected $valueSelectedByUser');
                    selectedCollege = (valueSelectedByUser);
                  });
                },
                iconSize: 30,
                isExpanded: true,
              )),
          Container(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: GestureDetector(
//                borderSide: BorderSide(color: Colors.pinkAccent),

                  onTap: _handleSignIn,
                  child: Card(
                    elevation: 5,
                    color: Colors.blueAccent,
                    child: Row(
                      children: <Widget>[
                        Card(
                          child: imgg(),
                          elevation: 0,
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            '          Sign in with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ],
      );
    }
  }

  //img google icon
  Widget imgg() {
    var assetImage = AssetImage("assets/icon/g.png");
    var image = Image(
      image: assetImage,
      height: 25,
      width: 25,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
    );
  }

//App Drawer
  Widget _buildBodyforAppDrawer() {
    if (_currentUser != null) {
      return ListView(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            color: Colors.amberAccent.shade100,
            child: Center(
              child: Text("You are currently signed in as",
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ListTile(
                leading: GoogleUserCircleAvatar(
                  identity: _currentUser,
                ),
                title: Text(_currentUser.displayName ?? ''),
                subtitle: Text(_currentUser.email ?? ''),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              child: RaisedButton.icon(
                icon: CircleAvatar(
                  child: imgg(),
                  backgroundColor: Colors.white70,
                ),
                color: Colors.pinkAccent,
                onPressed: () {
                  try {
                    _handleSignOut();
                  } catch (e) {}
                },
                label: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
        ],
      );
    } else {
      return ListView(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
          Center(
            child: Text('You are not signed in...',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ),
          Center(
              child: Icon(
            Icons.person_pin,
            size: 85,
            color: Colors.deepPurple,
          )),
          Container(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: RaisedButton.icon(
                icon: CircleAvatar(
                  child: imgg(),
                  backgroundColor: Colors.white70,
                ),
                color: Colors.pinkAccent,
                onPressed: _handleSignIn,
                label: Text(
                  'Sign in with Google',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )),
        ],
      );
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
      internet();
    }
  }

  Future<void> _handleSignOut() async {
    try {
      _googleSignIn.disconnect();
    } catch (error) {
      internet();
    }
  }

  //snackbar logout
  void showSnackBarLogout(BuildContext context) {
    String message = "You are logged out successfully!";
    final snackBar = SnackBar(
        content: Text(
      message,
      style: TextStyle(fontSize: 10),
    ));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  //snackbar login
  void _showSnackBarLogin(BuildContext context) {
    String message = "You are signed in as ${_currentUser.email}";
    final snackBar = SnackBar(
        content: Text(
      message,
      style: TextStyle(fontSize: 10),
    ));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  //About App
  void help() {
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Icon(
          Icons.info,
          color: Colors.indigoAccent,
          size: 35,
        ),
        Text(
          " About ",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
      ]),
      content: ListView(
//mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text("Attendance App",
                    style: TextStyle(color: Colors.black, fontSize: 20))),
            Center(
                child: Text("Application Version: 1.0.0\n",
                    style: TextStyle(color: Colors.black45, fontSize: 15))),
            Center(
                child: CircleAvatar(
              minRadius: 55,
              backgroundColor: Colors.yellow.shade100,
              child: imgAppIcon(),
            )),
            Center(
                child: Text(
              "\nCopyright © 2020 Saurav Kumar\n",
              style: TextStyle(color: Colors.redAccent, fontSize: 14),
            )),
            Center(
                child: Text(
                    "Thanks for using this app. For any help or feedback, contact the developer at : \n")),
            GestureDetector(
              onLongPress: null,
              onTap: null,
              child: Card(
                  child: Center(
                      child: Column(
                children: <Widget>[
                  Text(
                    "Email:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "sauravkumar.cse2018@nsec.ac.in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.lightBlue),
                  ),
                ],
              ))),
            ),
            GestureDetector(
              onLongPress: _launchURL,
              onTap: _launchURL,
              child: Card(
                  child: Center(
                      child: Column(
                children: <Widget>[
                  Text(
                    "Website:",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "https://attendanceapp.ml",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.lightBlue),
                  ),
                ],
              ))),
            ),
          ]),
      actionsOverflowDirection: VerticalDirection.up,
      actions: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: FlatButton(
              child: Text(
                "VIEW  LICENSES",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.pinkAccent),
              ),
              onPressed: () async {
                const url = 'https://attendanceapp.ml/licenses.html';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            )),
        Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 5),
              child: FlatButton(
                child: Text(
                  "CLOSE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                onPressed: () {
                  Navigator.of(this.context).pop();
                },
              )),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget imgAppIcon() {
    var assetImage = AssetImage("assets/icon/icon.png");
    var image = Image(
      image: assetImage,
      width: 75,
      height: 75,
    );
    return Container(
      child: image,
//      alignment: Alignment.center,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
    );
  }

  //Internet Reminder
  void internet() {
    AlertDialog alertDialog = AlertDialog(
      elevation: 10,
      backgroundColor: Colors.white,
      title: Text("Network ERROR!"),
      content: Text("Unable to connect to the Internet."),
    );
    showDialog(context: this.context, builder: (_) => alertDialog);
  }

  //time
  Future<Null> _selectTime(context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  //date
  Future<Null> _selectDate(context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1500, 1),
        lastDate: DateTime(3000));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void gotoscreen1(
      GoogleSignInAccount _currentUser,
      GoogleSignIn _googleSignIn,
      selectedCollege,
      selectedCourse,
      selectedSemester,
      selectedDepartment,
      finalSubject,
      selectedYear,
      List list,
      selectedSection) {
    Navigator.push(
        this.context,
        MaterialPageRoute(
            builder: (context) => screen1(
                _currentUser,
                _googleSignIn,
                selectedCollege,
                selectedCourse,
                selectedSemester,
                selectedDepartment,
                finalSubject,
                selectedYear,
                list,
                selectedSection)));
  }

  _launchURL() async {
    const url = 'https://attendanceapp.ml';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //<DATABASE>
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    var directory = await getExternalStorageDirectory();

    String path = join(directory.path, 'attendanceapp.db');

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    _createDb(notesDatabase, 1);
    debugPrint(
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\nDataBase created Successfully! ${directory.path}\n$path\n\n\n\n\n\n\n\n\n\n\n\n\n");

    return notesDatabase;
  }

  void _createDb(Database dbs, int newVersion) async {
    String dash = "_";
    noteTable =
        "NSEC_$selectedCourse$dash$selectedYear$dash$selectedDepartment$dash$selectedSection$dash$selectedSemester$dash$finalSubject";

    await dbs.execute(
        'CREATE TABLE $noteTable ( $colSNo INTEGER PRIMARY KEY AUTOINCREMENT, $colCollege TEXT, $colCourseDegree TEXT, $colSemester TEXT, $colDepartment TEXT, $colSection TEXT, $colSubject TEXT,$colTeacher TEXT, $colPassoutYear TEXT, $colStudentID TEXT NOT NULL UNIQUE, $colUniversityROLL INTEGER , $colClassROLL INTEGER NOT NULL , $colName TEXT NOT NULL , $colTotalAttendance INTEGER DEFAULT 0, $colPresentDays INTEGER DEFAULT 0 ,  $colAttendancePercent DECIMAL(5,2) DEFAULT 000.00 ,$colDay1 TEXT, $colDay2 TEXT, $colDay3 TEXT, $colDay4 TEXT, $colDay5 TEXT, $colDay6 TEXT, $colDay7 TEXT, $colDay8 TEXT, $colDay9 TEXT, $colDay10 TEXT, $colDay11 TEXT, $colDay12 TEXT, $colDay13 TEXT, $colDay14 TEXT, $colDay15 TEXT, $colDay16 TEXT, $colDay17 TEXT, $colDay18 TEXT, $colDay19 TEXT, $colDay20 TEXT, $colDay21 TEXT, $colDay22 TEXT, $colDay23 TEXT, $colDay24 TEXT, $colDay25 TEXT, $colDay26 TEXT, $colDay27 TEXT, $colDay28 TEXT, $colDay29 TEXT, $colDay30 TEXT, $colDay31 TEXT, $colDay32 TEXT, $colDay33 TEXT, $colDay34 TEXT, $colDay35 TEXT, $colDay36 TEXT, $colDay37 TEXT, $colDay38 TEXT, $colDay39 TEXT, $colDay40 TEXT, $colDay41 TEXT, $colDay42 TEXT, $colDay43 TEXT, $colDay44 TEXT, $colDay45 TEXT, $colDay46 TEXT, $colDay47 TEXT, $colDay48 TEXT, $colDay49 TEXT, $colDay50 TEXT, $colDay51 TEXT, $colDay52 TEXT, $colDay53 TEXT, $colDay54 TEXT, $colDay55 TEXT, $colDay56 TEXT, $colDay57 TEXT, $colDay58 TEXT, $colDay59 TEXT, $colDay60 TEXT, $colDay61 TEXT, $colDay62 TEXT, $colDay63 TEXT, $colDay64 TEXT, $colDay65 TEXT, $colDay66 TEXT, $colDay67 TEXT, $colDay68 TEXT, $colDay69 TEXT, $colDay70 TEXT, $colDay71 TEXT, $colDay72 TEXT, $colDay73 TEXT, $colDay74 TEXT, $colDay75 TEXT, $colDay76 TEXT, $colDay77 TEXT, $colDay78 TEXT, $colDay79 TEXT, $colDay80 TEXT, $colDay81 TEXT, $colDay82 TEXT, $colDay83 TEXT, $colDay84 TEXT, $colDay85 TEXT, $colDay86 TEXT, $colDay87 TEXT, $colDay88 TEXT, $colDay89 TEXT, $colDay90 TEXT, $colDay91 TEXT, $colDay92 TEXT, $colDay93 TEXT, $colDay94 TEXT, $colDay95 TEXT, $colDay96 TEXT, $colDay97 TEXT, $colDay98 TEXT, $colDay99 TEXT, $colDay100 TEXT, $colDay101 TEXT, $colDay102 TEXT, $colDay103 TEXT, $colDay104 TEXT, $colDay105 TEXT, $colDay106 TEXT, $colDay107 TEXT, $colDay108 TEXT, $colDay109 TEXT, $colDay110 TEXT, $colDay111 TEXT, $colDay112 TEXT, $colDay113 TEXT, $colDay114 TEXT, $colDay115 TEXT, $colDay116 TEXT, $colDay117 TEXT, $colDay118 TEXT, $colDay119 TEXT, $colDay120 TEXT, $colDay121 TEXT, $colDay122 TEXT, $colDay123 TEXT, $colDay124 TEXT, $colDay125 TEXT, $colDay126 TEXT, $colDay127 TEXT, $colDay128 TEXT, $colDay129 TEXT, $colDay130 TEXT, $colDay131 TEXT, $colDay132 TEXT, $colDay133 TEXT, $colDay134 TEXT, $colDay135 TEXT, $colDay136 TEXT, $colDay137 TEXT, $colDay138 TEXT, $colDay139 TEXT, $colDay140 TEXT, $colDay141 TEXT, $colDay142 TEXT, $colDay143 TEXT, $colDay144 TEXT, $colDay145 TEXT, $colDay146 TEXT, $colDay147 TEXT, $colDay148 TEXT, $colDay149 TEXT, $colDay150 TEXT )');

    debugPrint("\n\nTABLE created Successfully!\nTableNAME=$noteTable\n\n\n");
  }
}
