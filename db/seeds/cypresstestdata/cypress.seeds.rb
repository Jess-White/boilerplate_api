# frozen_string_literal: true

puts 'Seeding Cypress Test data...'

andrew = User.create!({
                        first_name: 'Andrew',
                        last_name: 'Barnes',
                        email: 'abarnes@thecypresstree.org',
                        password: 'password',
                        active: true
                      })
breanna = User.create!({
                         first_name: 'Breanna',
                         last_name: 'Chin',
                         email: 'bchin@thecypresstree.org',
                         password: 'password',
                         active: true
                       })
carl = User.create!({
                      first_name: 'Carl',
                      last_name: 'Diaz',
                      email: 'cdiaz@thecypresstree.org',
                      password: 'password',
                      active: true
                    })
esther = User.create!({
                        first_name: 'Esther',
                        last_name: 'Morowitz',
                        email: 'emorowitz@thecypresstree.org',
                        password: 'password',
                        active: true
                      })
frank = User.create!({
                       first_name: 'Frank',
                       last_name: 'Vinh',
                       email: 'fvinh@thecypresstree.org', password: 'password',

                       active: true
                     })
giulia = User.create!({
                        first_name: 'Giulia',
                        last_name: 'Hillman',
                        email: 'ghillman@thecypresstree.org',
                        password: 'password',
                        active: true
                      })

the_cypress_tree = Organization.create!({
                                          name: 'The Cypress Tree',
                                          users: [andrew, breanna, carl, esther, frank, giulia],
                                          funding_orgs: [
                                            FundingOrg.new({ website: 'https://thehinokifoundation.org',
                                                             name: 'The Hinoki Foundation' }),
                                            FundingOrg.new({ website: 'https://thearlesfund.org',
                                                             name: 'The Arles Fund' })
                                          ],
                                          categories: [
                                            Category.new({ name: 'General Purpose' }),
                                            Category.new({ name: 'Financial Literacy' }),
                                            Category.new({ name: 'Gender Equality' }),
                                            Category.new({ name: 'Family Services' }),
                                            Category.new({ name: 'Cultural and Community Programming' }),
                                            Category.new({ name: 'Education' }),
                                            Category.new({ name: 'Legal Aid' })
                                          ]
                                        })

category_general_purpose = the_cypress_tree.categories[0]
category_family_services = the_cypress_tree.categories[3]
category_cultural_and_community_programming = the_cypress_tree.categories[4]

the_cypress_tree.grants.create!([
                                  {
                                    title: 'Cypress Tree Neighborhood Grant',
                                    funding_org: the_cypress_tree.funding_orgs[0],
                                    rfp_url: 'https://thehinokifoundation.org/neighborhood_seed_grants',
                                    deadline: DateTime.now.next_week,
                                    submitted: true,
                                    successful: true,
                                    purpose: 'general funding',
                                    sections: [
                                      Section.new({
                                                    **GrantFactory.section_info,
                                                    sort_order: 1
                                                  }),
                                      Section.new({
                                                    **GrantFactory.section_info,
                                                    sort_order: 2
                                                  }),
                                      Section.new({
                                                    **GrantFactory.section_info,
                                                    sort_order: 3
                                                  }),
                                      Section.new({
                                                    **GrantFactory.section_info,
                                                    sort_order: 4
                                                  }),
                                      Section.new({
                                                    **GrantFactory.section_info,
                                                    sort_order: 5
                                                  }),
                                      Section.new({
                                                    **GrantFactory.section_info,
                                                    sort_order: 6
                                                  })
                                    ]
                                  },
                                  {
                                    title: 'Hinoki Foundation Restorative Justice Initiative Grant',
                                    funding_org: the_cypress_tree.funding_orgs[0],
                                    rfp_url: 'https://thehinokifoundation.org/restorative_justice_initiative_rfp',
                                    deadline: DateTime.now.next_week,
                                    submitted: false,
                                    successful: false,
                                    purpose: 'civic education'
                                  },
                                  {
                                    title: 'Hinoki Foundation Housing Equality Neighborhood Renewal 2023',
                                    funding_org: the_cypress_tree.funding_orgs[0],
                                    rfp_url: 'https://thehinokifoundation.org/newneighborhoods',
                                    deadline: DateTime.now.next_week,
                                    submitted: false,
                                    successful: false,
                                    purpose: 'housing and neighborhood development'
                                  },
                                  {
                                    title: 'Hinoki Foundation GOTV Voter Education Grant',
                                    funding_org: the_cypress_tree.funding_orgs[0],
                                    rfp_url: 'https://thehinokifoundation.org/voter_education_request_proposals',
                                    deadline: DateTime.now.next_week,
                                    submitted: false,
                                    successful: false,
                                    purpose: 'Civic Education'
                                  },
                                  {
                                    title: 'Arles Fund Financial Literacy for Women Grant',
                                    funding_org: the_cypress_tree.funding_orgs[1],
                                    rfp_url: 'https://arles_fund/financial_education_rfp',
                                    deadline: DateTime.now.next_week,
                                    submitted: false,
                                    successful: false,
                                    purpose: 'financial education and gender equality'
                                  },
                                  {
                                    title: 'Arles Fund Small Business Seed Money Grant',
                                    funding_org: the_cypress_tree.funding_orgs[1],
                                    rfp_url: 'https://arles_fund/entrepreneur_seed_grants_2023',
                                    deadline: DateTime.now.next_week,
                                    submitted: false,
                                    successful: false,
                                    purpose: 'financial education and small business'
                                  }
                                ])

the_cypress_tree.grants.create!([
                                  {
                                    title: 'Cypress Tree Overview Drag and Drop Test Grant',
                                    funding_org: the_cypress_tree.funding_orgs[0],
                                    rfp_url: 'https://thehinokifoundation.org/neighborhood_seed_grants',
                                    deadline: DateTime.now.next_week,
                                    submitted: true,
                                    successful: true,
                                    purpose: 'general funding',
                                    sections: [
                                      Section.new({
                                                    title: 'Section 1',
                                                    text: <<-TEXT,
                                                    Text for Section 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu cursus vitae congue mauris. Sit amet venenatis urna cursus. Volutpat odio facilisis mauris sit amet. Scelerisque felis imperdiet proin fermentum leo vel orci. Donec ultrices tincidunt arcu non sodales neque sodales ut etiam. Magna fringilla urna porttitor rhoncus. Tristique senectus et netus et malesuada. Rhoncus urna neque viverra justo nec. Lectus quam id leo in vitae turpis. Volutpat blandit aliquam etiam erat velit scelerisque in dictum non. Mauris nunc congue nisi vitae suscipit tellus mauris a. Enim neque volutpat ac tincidunt vitae semper quis lectus. Donec massa sapien faucibus et molestie ac. Orci phasellus egestas tellus rutrum tellus pellentesque eu. Faucibus in ornare quam viverra orci sagittis eu volutpat odio. Commodo viverra maecenas accumsan lacus vel facilisis volutpat. Justo donec enim diam vulputate ut.
                                                    TEXT
                                                    wordcount: 6,
                                                    sort_order: 1
                                                  }),
                                      Section.new({
                                                    title: 'Section 2',
                                                    text: <<-TEXT,
                                                    Text for Section 2 Faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Suspendisse potenti nullam ac tortor vitae purus. Sit amet consectetur adipiscing elit. Risus viverra adipiscing at in tellus integer feugiat scelerisque. Accumsan tortor posuere ac ut consequat semper viverra. Interdum velit laoreet id donec ultrices tincidunt arcu. Viverra vitae congue eu consequat. Dui sapien eget mi proin sed libero enim sed. Vivamus arcu felis bibendum ut tristique et egestas quis. Enim facilisis gravida neque convallis a cras semper. Adipiscing commodo elit at imperdiet dui accumsan sit. At augue eget arcu dictum varius duis at consectetur. Felis donec et odio pellentesque diam volutpat commodo sed egestas. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Lectus magna fringilla urna porttitor rhoncus dolor purus. Imperdiet proin fermentum leo vel. Nam aliquam sem et tortor consequat. Nec ullamcorper sit amet risus nullam.
                                                    TEXT
                                                    wordcount: 6,
                                                    sort_order: 2
                                                  }),
                                      Section.new({
                                                    title: 'Section 3',
                                                    text: <<-TEXT,
                                                    Text for Section 3 Nibh nisl condimentum id venenatis a condimentum vitae sapien pellentesque. Porta non pulvinar neque laoreet suspendisse interdum consectetur libero. Ipsum dolor sit amet consectetur. Eu sem integer vitae justo eget magna. Urna molestie at elementum eu facilisis sed odio morbi. Scelerisque eleifend donec pretium vulputate sapien nec. Elit eget gravida cum sociis natoque penatibus et magnis dis. Massa enim nec dui nunc mattis enim ut tellus. At risus viverra adipiscing at in tellus integer feugiat. Gravida neque convallis a cras semper. Varius vel pharetra vel turpis nunc eget lorem. Consequat interdum varius sit amet mattis vulputate enim. Lectus urna duis convallis convallis tellus id interdum. Ut eu sem integer vitae justo.
                                                    TEXT
                                                    wordcount: 6,
                                                    sort_order: 3
                                                  }),
                                      Section.new({
                                                    title: 'Section 4',
                                                    text: <<-TEXT,
                                                    Text for Section 4 Tincidunt tortor aliquam nulla facilisi. Dui id ornare arcu odio ut sem nulla. Duis at tellus at urna. Sit amet luctus venenatis lectus magna fringilla urna. At imperdiet dui accumsan sit amet. Massa id neque aliquam vestibulum. Commodo elit at imperdiet dui accumsan sit amet nulla facilisi. Pretium fusce id velit ut tortor pretium viverra suspendisse potenti. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. Vestibulum lorem sed risus ultricies tristique nulla aliquet. Aliquam faucibus purus in massa tempor. Sem et tortor consequat id porta nibh venenatis. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Malesuada pellentesque elit eget gravida cum. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Viverra nibh cras pulvinar mattis nunc sed blandit. Et malesuada fames ac turpis egestas maecenas pharetra convallis posuere. Egestas congue quisque egestas diam in. Neque vitae tempus quam pellentesque nec nam aliquam sem. Adipiscing elit pellentesque habitant morbi tristique senectus et netus.
                                                    TEXT
                                                    wordcount: 6,
                                                    sort_order: 4
                                                  }),
                                      Section.new({
                                                    title: 'Section 5',
                                                    text: <<-TEXT,
                                                    Text for Section 5 Mauris nunc congue nisi vitae suscipit tellus. In eu mi bibendum neque egestas congue quisque egestas diam. Enim sed faucibus turpis in eu mi. Suscipit adipiscing bibendum est ultricies integer quis auctor. Varius vel pharetra vel turpis nunc eget lorem dolor sed. Urna duis convallis convallis tellus id interdum velit. Euismod nisi porta lorem mollis aliquam ut porttitor leo. Lectus mauris ultrices eros in cursus turpis massa tincidunt dui. Velit scelerisque in dictum non. Consectetur a erat nam at lectus urna duis convallis convallis. Sed augue lacus viverra vitae congue eu. Est pellentesque elit ullamcorper dignissim cras tincidunt lobortis.'
                                                    TEXT
                                                    wordcount: 6,
                                                    sort_order: 5
                                                  }),
                                      Section.new({
                                                    title: 'Section 6',
                                                    text: <<-TEXT,
                                                    Text for Section 6 Sapien pellentesque habitant morbi tristique senectus. Sed sed risus pretium quam vulputate dignissim. Faucibus scelerisque eleifend donec pretium vulputate sapien. Tristique senectus et netus et. Diam maecenas ultricies mi eget mauris. Etiam tempor orci eu lobortis elementum nibh tellus molestie nunc. At ultrices mi tempus imperdiet nulla malesuada pellentesque. Mauris vitae ultricies leo integer malesuada nunc. Ultrices vitae auctor eu augue. Platea dictumst quisque sagittis purus. Sagittis purus sit amet volutpat consequat mauris nunc congue. Tellus rutrum tellus pellentesque eu tincidunt tortor aliquam nulla. Sed viverra tellus in hac habitasse platea dictumst. At erat pellentesque adipiscing commodo elit. Dignissim sodales ut eu sem integer. Adipiscing commodo elit at imperdiet dui accumsan sit amet. Eget magna fermentum iaculis eu. A iaculis at erat pellentesque adipiscing commodo elit.
                                                    TEXT
                                                    wordcount: 6,
                                                    sort_order: 6
                                                  })
                                    ]
                                  }
                                ])

the_cypress_tree.boilerplates.create!([
                                        {
                                          category: category_general_purpose,
                                          **GrantFactory.section_info
                                        },
                                        {
                                          category: category_general_purpose,
                                          **GrantFactory.section_info
                                        },
                                        {
                                          category: category_cultural_and_community_programming,
                                          **GrantFactory.section_info
                                        },
                                        {
                                          title: 'Ask Us More',
                                          category: category_family_services,
                                          text: <<-TEXT,
                                          Ekram Hanna, MIRA Community Engagement Manager, Certified Mental Health First Aid Trainer
                                          TEXT
                                          wordcount: 15
                                        },
                                        {
                                          title: 'New Age',
                                          category: category_family_services,
                                          text: <<-TEXT,
                                          MIRA works with clients to address their educational needs, including assistance applying for college credit and training programs, evaluating educational credentials, and applying for financial aid. In FY18-19 MIRA provided 97 Adult Education Clients with 152 Adult Education Case Activities.
                                          TEXT
                                          wordcount: 41
                                        },
                                        {
                                          category: category_general_purpose,
                                          **GrantFactory.section_info
                                        },
                                        {
                                          category: category_general_purpose,
                                          **GrantFactory.section_info
                                        }
                                      ])

puts 'The Cypress Tree data seeded!'
puts "\temail: #{andrew.email}"
puts "\tpassword: #{andrew.password}"
puts
