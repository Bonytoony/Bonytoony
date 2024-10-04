actor {
      // Struktur data untuk menyimpan informasi pengguna
          type User = {
                    username: Text;
                            password: Text;
                                    email: Text;
                                            bio: Text;
          };

              // Struktur data untuk postingan blog
                  type BlogPost = {
                            id: Nat;
                                    title: Text;
                                            content: Text;
                                                    author: Text;
                                                            timestamp: Int;
                  };

                      // Penyimpanan pengguna
                          stable var users: [User] = [];

                              // Penyimpanan postingan blog
                                  stable var blogPosts: [BlogPost] = [];

                                      // Penyimpanan feedback
                                          stable var feedbackMessages: [Text] = [];

                                              // Fungsi untuk menyapa pengguna
                                                  public query func greet(name: Text): async Text {
                                                            return "Hello, " # name # "! Welcome to Ulul's personal website!";
                                                  };

                                                      // Fungsi untuk menambah pengguna baru
                                                          public func registerUser(username: Text, password: Text, email: Text, bio: Text): async Bool {
                                                                    // Cek apakah username sudah ada
                                                                            let userExists = users.exists(func (u) = u.username == username);
                                                                                    if (userExists) {
                                                                                                  return false;
                                                                                    };
                                                                                            // Tambah pengguna baru ke list
                                                                                                    let newUser = {
                                                                                                                  username = username;
                                                                                                                              password = password;
                                                                                                                                          email = email;
                                                                                                                                                      bio = bio;
                                                                                                    };
                                                                                                            users := Array.append(users, [newUser]);
                                                                                                                    return true;
                                                          };

                                                              // Fungsi untuk login
                                                                  public query func login(username: Text, password: Text): async Bool {
                                                                            return users.exists(func (u) = u.username == username and u.password == password);
                                                                  };

                                                                      // Fungsi untuk menambah postingan blog
                                                                          public func addBlogPost(title: Text, content: Text, author: Text): async Bool {
                                                                                    let newPost = {
                                                                                                  id = Nat(blogPosts.size() + 1);
                                                                                                              title = title;
                                                                                                                          content = content;
                                                                                                                                      author = author;
                                                                                                                                                  timestamp = Time.now();
                                                                                    };
                                                                                            blogPosts := Array.append(blogPosts, [newPost]);
                                                                                                    return true;
                                                                          };

                                                                              // Fungsi untuk mengambil semua postingan blog
                                                                                  public query func getBlogPosts(): async [BlogPost] {
                                                                                            return blogPosts;
                                                                                  };

                                                                                      // Fungsi untuk menambah feedback
                                                                                          public func addFeedback(msg: Text): async () {
                                                                                                    feedbackMessages := Array.append(feedbackMessages, [msg]);
                                                                                          };

                                                                                              // Fungsi untuk mengambil feedback
                                                                                                  public query func getFeedback(): async [Text] {
                                                                                                            return feedbackMessages;
                                                                                                  };
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
                                                  }
                  }
          }
}
