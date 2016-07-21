# Content.destroy_all

# Content.create([{
#             title: "Monkey Meme",
#             url: "http://www.windowsmode.com/wp-content/uploads/2015/08/HD-Dog-wallpaper.jpg",
#             category: "Meme",
#             sentiment: "Laugh"
#           },
#           {
#             title: "Cute Dog",
#             url: "http://img.memecdn.com/Cool-Story-Bro_o_91043.jpg",
#             category: "Image",
#             sentiment: "Cute"
#           },
#           {
#             title: "Baby Laughing",
#             url: "http://previews.123rf.com/images/flashon/flashon1109/flashon110900212/10686113-happy-big-laughing-7-month-old-African-American-baby-boy-Stock-Photo.jpg",
#             category: "GIF",
#             sentiment: "Babies"
#           }])


User.destroy_all


User.create([{
          first_name: "Emilio",
          last_name: "Gomez",
          email: "emiliogomezlavin@gmail.com",
          password: "12345",
          boozt_start: 20,
          boozt_end: 21,
          boozts_per_frequency: 3,
          phone_number: "+14158496622"
          },
          {
          first_name: "Juan",
          last_name: "Perez",
          email: "emiliogomezlavin@gmail.com",
          password: "12345",
          boozt_start: 20,
          boozt_end: 21,
          boozts_per_frequency: 1,
          phone_number: "+14158496622"
          },
          {
          first_name: "John",
          last_name: "Smith",
          email: "emiliogomezlavin@gmail.com",
          password: "12345",
          boozt_start: 20,
          boozt_end: 21,
          boozts_per_frequency: 5,
          phone_number: "+14158496622"
        }])