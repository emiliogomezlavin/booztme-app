Content.destroy_all

Content.create([{
            title: "Monkey Meme",
            url: "http://www.windowsmode.com/wp-content/uploads/2015/08/HD-Dog-wallpaper.jpg",
            category: "Meme",
            sentiment: "Laugh"
          },
          {
            title: "Cute Dog",
            url: "http://img.memecdn.com/Cool-Story-Bro_o_91043.jpg",
            category: "Image",
            sentiment: "Cute"
          },
          {
            title: "Baby Laughing",
            url: "http://previews.123rf.com/images/flashon/flashon1109/flashon110900212/10686113-happy-big-laughing-7-month-old-African-American-baby-boy-Stock-Photo.jpg",
            category: "GIF",
            sentiment: "Babies"
          }])


User.destroy_all

User.create([{
          first_name: "Emilio",
          last_name: "Gomez",
          email: "emilio@example.com",
          password_digest: "12345"
          },
          {
          first_name: "Juan",
          last_name: "Perez",
          email: "juan@example.com",
          password_digest: "12345"
          },
          {
          first_name: "John",
          last_name: "Smith",
          email: "john@example.com",
          password_digest: "12345"
        }])