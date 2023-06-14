//
//  movie_controller.swift
//  List_movie
//
//  Created by MobApp on 05/06/23.
//

import Foundation

class MovieVM: ObservableObject {
    @Published var imgUrl = "https://image.tmdb.org/t/p/w1280"
    static let jsonObject: [[String: Any]] =  [
        [
          "adult": false,
          "backdrop_path": "/u4SDPknBWEEOCzPJvL0NwApkQSR.jpg",
          "genre_ids": [
            16,
            10751,
            12,
            14,
            35
          ],
          "id": 502356,
          "original_language": "en",
          "original_title": "The Super Mario Bros. Movie",
          "overview": "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
          "popularity": 5368.542,
          "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
          "release_date": "2023-04-05",
          "title": "The Super Mario Bros. Movie",
          "video": false,
          "vote_average": 7.8,
          "vote_count": 4117
        ],
        [
          "adult": false,
          "backdrop_path": "/4t0oBFrJyweYPt0hocW6RUa0b6H.jpg",
          "genre_ids": [
            28,
            80,
            53
          ],
          "id": 385687,
          "original_language": "en",
          "original_title": "Fast X",
          "overview": "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
          "popularity": 3421.016,
          "poster_path": "/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
          "release_date": "2023-05-17",
          "title": "Fast X",
          "video": false,
          "vote_average": 7,
          "vote_count": 780
        ],
        [
          "adult": false,
          "backdrop_path": "/2I5eBh98Q4aPq8WdQrHdTC8ARhY.jpg",
          "genre_ids": [
            28,
            12,
            16,
            878
          ],
          "id": 569094,
          "original_language": "en",
          "original_title": "Spider-Man: Across the Spider-Verse",
          "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
          "popularity": 2748.522,
          "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
          "release_date": "2023-05-31",
          "title": "Spider-Man: Across the Spider-Verse",
          "video": false,
          "vote_average": 8.8,
          "vote_count": 420
        ],
        [
          "adult": false,
          "backdrop_path": "/1IM8i8HiomFC4y6NRyBuDrHJWg3.jpg",
          "genre_ids": [
            12,
            10751,
            14,
            10749
          ],
          "id": 447277,
          "original_language": "en",
          "original_title": "The Little Mermaid",
          "overview": "The youngest of King Triton’s daughters, and the most defiant, Ariel longs to find out more about the world beyond the sea, and while visiting the surface, falls for the dashing Prince Eric. With mermaids forbidden to interact with humans, Ariel makes a deal with the evil sea witch, Ursula, which gives her a chance to experience life on land, but ultimately places her life – and her father’s crown – in jeopardy.",
          "popularity": 2224.267,
          "poster_path": "/ym1dxyOk4jFcSl4Q2zmRrA5BEEN.jpg",
          "release_date": "2023-05-18",
          "title": "The Little Mermaid",
          "video": false,
          "vote_average": 6.1,
          "vote_count": 457
        ],
        [
          "adult": false,
          "backdrop_path": "/aAgGrfBwna1nO4M2USxwFgK5O0t.jpg",
          "genre_ids": [
            53,
            27
          ],
          "id": 713704,
          "original_language": "en",
          "original_title": "Evil Dead Rise",
          "overview": "Three siblings find an ancient vinyl that gives birth to bloodthirsty demons that run amok in a Los Angeles apartment building and thrusts them into a primal battle for survival as they face the most nightmarish version of family imaginable.",
          "popularity": 2093.656,
          "poster_path": "/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg",
          "release_date": "2023-04-12",
          "title": "Evil Dead Rise",
          "video": false,
          "vote_average": 7.1,
          "vote_count": 1500
        ],
        [
          "adult": false,
          "backdrop_path": "/94TIUEhuwv8PhdIADEvSuwPljS5.jpg",
          "genre_ids": [
            28,
            10752
          ],
          "id": 840326,
          "original_language": "fi",
          "original_title": "Sisu",
          "overview": "Deep in the wilderness of Lapland, Aatami Korpi is searching for gold but after he stumbles upon Nazi patrol, a breathtaking and gold-hungry chase through the destroyed and mined Lapland wilderness begins.",
          "popularity": 1830.349,
          "poster_path": "/ygO9lowFMXWymATCrhoQXd6gCEh.jpg",
          "release_date": "2023-01-27",
          "title": "Sisu",
          "video": false,
          "vote_average": 7.4,
          "vote_count": 585
        ],
        [
          "adult": false,
          "backdrop_path": "/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
          "genre_ids": [
            878,
            12,
            28
          ],
          "id": 447365,
          "original_language": "en",
          "original_title": "Guardians of the Galaxy Vol. 3",
          "overview": "Peter Quill, still reeling from the loss of Gamora, must rally his team around him to defend the universe along with protecting one of their own. A mission that, if not completed successfully, could quite possibly lead to the end of the Guardians as we know them.",
          "popularity": 1596.795,
          "poster_path": "/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg",
          "release_date": "2023-05-03",
          "title": "Guardians of the Galaxy Vol. 3",
          "video": false,
          "vote_average": 8.1,
          "vote_count": 1808
        ],
        [
          "adult": false,
          "backdrop_path": "/T5xXoFqyc9jNXZIbH4Sw0jwWjw.jpg",
          "genre_ids": [
            28,
            80,
            53,
            9648
          ],
          "id": 605886,
          "original_language": "en",
          "original_title": "To Catch a Killer",
          "overview": "Baltimore. New Year's Eve. A talented but troubled police officer is recruited by the FBI's chief investigator to help profile and track down a mass murderer.",
          "popularity": 1458.693,
          "poster_path": "/mFp3l4lZg1NSEsyxKrdi0rNK8r1.jpg",
          "release_date": "2023-04-06",
          "title": "To Catch a Killer",
          "video": false,
          "vote_average": 6.9,
          "vote_count": 225
        ],
        [
          "adult": false,
          "backdrop_path": "/eTvN54pd83TrSEOz6wbsXEJktCV.jpg",
          "genre_ids": [
            10752,
            28,
            53
          ],
          "id": 882569,
          "original_language": "en",
          "original_title": "Guy Ritchie's The Covenant",
          "overview": "During the war in Afghanistan, a local interpreter risks his own life to carry an injured sergeant across miles of grueling terrain.",
          "popularity": 1541.629,
          "poster_path": "/kVG8zFFYrpyYLoHChuEeOGAd6Ru.jpg",
          "release_date": "2023-04-19",
          "title": "Guy Ritchie's The Covenant",
          "video": false,
          "vote_average": 7.6,
          "vote_count": 440
        ],
        [
          "adult": false,
          "backdrop_path": "/kyeqDT2cFhTmwlvtuQY3n2W6Vf3.jpg",
          "genre_ids": [
            28,
            53,
            27
          ],
          "id": 799379,
          "original_language": "ko",
          "original_title": "늑대사냥",
          "overview": "While under heavily armed guard, the dangerous convicts aboard a cargo ship unite in a coordinated escape attempt that soon escalates into a bloody, all-out riot. But as the fugitives continue their brutal campaign of terror, they soon discover that not even the most vicious among them is safe from the horror they unknowingly unleashed from the darkness below deck.",
          "popularity": 1374.848,
          "poster_path": "/dniWicB6fa7NvpGbguxWlNPMc5f.jpg",
          "release_date": "2022-09-21",
          "title": "Project Wolf Hunting",
          "video": false,
          "vote_average": 6.4,
          "vote_count": 149
        ],
        [
          "adult": false,
          "backdrop_path": "/hiHGRbyTcbZoLsYYkO4QiCLYe34.jpg",
          "genre_ids": [
            27,
            53
          ],
          "id": 758323,
          "original_language": "en",
          "original_title": "The Pope's Exorcist",
          "overview": "Father Gabriele Amorth, Chief Exorcist of the Vatican, investigates a young boy's terrifying possession and ends up uncovering a centuries-old conspiracy the Vatican has desperately tried to keep hidden.",
          "popularity": 1345.099,
          "poster_path": "/gNPqcv1tAifbN7PRNgqpzY8sEJZ.jpg",
          "release_date": "2023-04-05",
          "title": "The Pope's Exorcist",
          "video": false,
          "vote_average": 7.3,
          "vote_count": 1300
        ],
        [
          "adult": false,
          "backdrop_path": "/i1eghEBiC0gN4KnwuUGC2fNiX1f.jpg",
          "genre_ids": [
            28,
            53
          ],
          "id": 552688,
          "original_language": "en",
          "original_title": "The Mother",
          "overview": "A deadly female assassin comes out of hiding to protect the daughter that she gave up years before, while on the run from dangerous men.",
          "popularity": 1221.109,
          "poster_path": "/vnRthEZz16Q9VWcP5homkHxyHoy.jpg",
          "release_date": "2023-05-04",
          "title": "The Mother",
          "video": false,
          "vote_average": 6.8,
          "vote_count": 697
        ],
        [
          "adult": false,
          "backdrop_path": "/jAmmb9RApuRckDJtYWeOgBUgQyG.jpg",
          "genre_ids": [
            16,
            28,
            14,
            878
          ],
          "id": 893712,
          "original_language": "ja",
          "original_title": "劇場版 ソードアート・オンライン -プログレッシブ- 冥き夕闇のスケルツォ",
          "overview": "Over a month has passed since 10,000 users were trapped inside the \"Sword Art Online\" world. Asuna, who cleared the first floor of the floating iron castle of Aincrad, joined up with Kirito and continued her journey to reach the top floor. With the support of female Information Broker Argo, clearing the floors seemed to be progressing smoothly, but conflict erupts between two major guilds who should be working together – the top player groups ALS (the Aincrad Liberation Squad) and DKB (the Dragon Knights Brigade). And meanwhile, behind the scenes exists a mysterious figure pulling the strings…",
          "popularity": 864.224,
          "poster_path": "/2lEyzOq6ILNgBpLLpTRckQhbNNt.jpg",
          "release_date": "2022-10-22",
          "title": "Sword Art Online the Movie -Progressive- Scherzo of Deep Night",
          "video": false,
          "vote_average": 7.7,
          "vote_count": 49
        ]

      ]
    
    @Published var nowPlayData: [NowPlayingElement] = []
    
    init(){
        print("ini masuk")
        convertJson()
    }
    
    
 func convertJson(){
        do {
            let json = try JSONSerialization.data(withJSONObject: MovieVM.jsonObject)
            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodednowPlay = try decoder.decode([NowPlayingElement].self, from: json)
            nowPlayData = decodednowPlay
        } catch {
            print(error)
        
        }
    }
    
}
