# frozen_string_literal: true

def count_words(section_title, section_text)
  str = "#{section_title} #{section_text}"
  str.strip.split(/\s+/).length
end

class GrantFactory
  GrantFactory::SECTIONS_TEXT = [
    <<-TEXT,
      MIRA offers a variety of support for families with children, including
      pre-school and school enrollment, working with teachers and administration,
      support for struggling students, parental support, and monthly Parents'
      Groups.&nbsp;In FY18-19 MIRA provided 120 Child and Family Services Clients with
      480 Child and Family Services Case Activities.
    TEXT

    <<-TEXT,
      MIRA provides the resources and structure for Middle Eastern refugees to support
      one another and welcome new arrivals with what they need to succeed through
      support groups, community events, and bridge-building activities with the wider
      Chicago community. In FY18-19 189 MIRA Community Empowerment Clients
      participated in 645 Empowerment Activities.
    TEXT

    <<-TEXT,
      MIRA works with clients to address their educational needs, including assistance
      applying for college credit and training programs, evaluating educational
      credentials, and applying for financial aid. In FY18-19 MIRA provided 97 Adult
      Education Clients with 152 Adult Education Case Activities.
    TEXT

    <<-TEXT,
      MIRA helps Middle Eastern refugees and immigrants access the services they need,
      including public benefits, healthcare, and referrals to partner organizations or
      other agencies. In FY18-19 MIRA provided 341 Case Management Clients with 677
      Case Management Case Activities.
    TEXT

    <<-TEXT,
      We will measure the success of these programs in terms of the volume and quality
      of the services we provide to our clients. We will provide this specialized
      training program at least four times over the course of the next year, in
      conjunction with a national training program that provides pre- and
      post-training testing on issues related to mental health awareness and
      treatment. As a result of this enhanced level of awareness among community
      members, we anticipate a higher level of referrals to mental health services
      ranging from counseling to substance-abuse recovery support to intimate partner
      violence services. We also anticipate an increased openness regarding these
      topics among our clients, including in their discussions with staff. Since we
      are an organization that emphasizes client-led coaching and peer support, we
      also anticipate more effective dialogues between staff members and clients
      seeking services at MIRA. We will also use our experience with this training to
      partner with other local agencies and address mental health issues
      collaboratively.
    TEXT

    <<-TEXT,
      With the introduction of a new shorter (4 hour) course, MIRA staff can engage
      more community members directly in training and raising awareness of mental
      health issues at a time when isolation, depression, and catastrophic losses will
      be affecting the entire country, and have the potential to devastate the newly
      developing Middle Eastern immigrant and refugee community on the north side of
      Chicago.
    TEXT

    <<-TEXT,
      Ekram Hanna, MIRA Community Engagement Manager, Certified Mental Health First
      Aid Trainer
    TEXT

    <<-TEXT,
      MIRA proposes the continuation of the Mental Health First Aid program funded
      through the Asian Giving Circle for 2019-20.&nbsp;In light of the current
      pandemic, isolation, and deaths, MIRA projects that the need for increased
      Mental Health awareness and education in the Middle Eastern immigrant and
      refugee community will continue to expand and it is vital to train more members
      of the community to provide Mental Health First Aid in the coming
      months.&nbsp;The goal of the proposed program is to educate and empower area
      community members to identify mental health issues in the community and provide
      referrals and resources to support refugee and immigrant community members in
      seeking mental health services. Mental Health First Aid is an evidence-based
      CDC-reviewed public education program that introduces participants to risk
      factors and warning signs of mental illnesses, builds understanding of their
      impact, and overviews common supports. This training course uses role-playing
      and simulations to demonstrate how to offer initial help in a mental health
      crisis and connect persons to the appropriate professional, peer, social, and
      self-help care. The program also teaches the common risk factors and warning
      signs of specific types of illnesses, like anxiety, depression, substance use,
      bipolar disorder, eating disorders, and schizophrenia. &nbsp;
    TEXT

    <<-TEXT,
      MIRA has provided the following services to over 600 clients and their families,
      with a total impact of about 1000 immigrants and refugees, in the last fiscal
      year (July 18 - June 19):</p><p><br></p><p>Community Engagement and Empowerment
      Programs:&nbsp;MIRA provides the resources and structure for Middle Eastern
      refugees to support one another and welcome new arrivals with what they need to
      succeed through support groups, community events, and bridge-building activities
      with the wider Chicago community. In&nbsp;FY18-19, 189 MIRA Community
      Empowerment Clients participated in 645 Empowerment
      Activities.</p><p><br></p><p>Case Management Program:&nbsp;MIRA helps Middle
      Eastern refugees and immigrants access the services they need, including public
      benefits, healthcare, and referrals to partner organizations or other agencies.
      In FY18-19 MIRA provided 341 Case Management Clients with 677 Case Management
      Case Activities.</p><p><br></p><p>Assistance for Families with Children: MIRA
      offers a variety of support for families with children, including pre-school and
      school enrollment, working with teachers and administration, support for
      struggling students, parental support, and monthly Parents' Groups.&nbsp;In
      FY18-19 MIRA provided 120 Child and Family Services Clients with 480 Child and
      Family Services Case Activities.</p><p><br></p><p>Adult Education Guidance
      Program:&nbsp;MIRA works with clients to address their educational needs,
      including assistance applying for college credit and training programs,
      evaluating educational credentials, and applying for financial aid. In FY18-19
      MIRA provided 97 Adult Education Clients with 152 Adult Education Case
      Activities.</p><p><br></p><p>Immigration Legal Services:&nbsp;The MIRA
      Immigration Legal Services Program assists with naturalization petitions and
      green card applications.&nbsp;There is no fee for the service, although
      application fees still apply. In FY18-19 MIRA assisted 240 clients with
      immigration legal services.
    TEXT

    <<-TEXT,
      At the beginning of 2020, a consultation among MIRA Board, Staff, and Community
      Members identified three primary areas for growth: Women and Children’s
      Empowerment, Legal Clinic Services, and Mental Health Promotion.&nbsp;While
      these are existing program areas, the goal for the organization is to align
      staff skills and training, funding resources, and community engagement to
      establish MIRA as the leader for these programs for Middle Eastern immigrants
      and refugees on the north side of Chicago.
    TEXT

    <<-TEXT
      MIRA, the Middle Eastern Immigrant and Refugee Alliance, was originally founded
      in 2009 as the Iraqi Mutual Aid Society by newly-arrived Iraqi refugees, in
      response to the challenges they faced while adapting to their new lives in the
      United States. MIRA forges connections between Middle Eastern and American
      society, and facilitates the preservation and exchange of Middle Eastern
      culture. Our goal is to foster well-being and self-sufficiency for resettled
      refugees and immigrants from across the Middle East and beyond, and to use our
      multilingual and multicultural expertise to tailor our services to the unique
      needs of our clients— whom we serve regardless of gender, religion, ethnicity,
      nationality, or family size. Our staff and volunteers speak Arabic, Assyrian,
      Kurdish, and Farsi. Almost all arrived to the United States as refugees
      themselves. These linguistic, cultural, and experiential connections with our
      Middle Eastern clients distinguish MIRA; there is no comparable organization
      serving this population in the Chicago area. Over the past ten years since the
      founding, MIRA has expanded to offer services to refugees, immigrants, asylees,
      and Special Immigrant Visa holders from all over the world, but we are proud to
      say that this founding spirit has only grown stronger— MIRA continues to be
      community-driven, refugee-powered, and closely attuned to the needs and voices
      of the population we serve.
    TEXT
  ].freeze

  GrantFactory::SECTIONS_TITLE = [
    'Mission',
    'What We Do',
    'Community Engagement and Empowerment Programs',
    'Case Management Program',
    'Assistance for Families With Children',
    'Adult Education Guidance Program',
    'Legal Services'
  ].freeze

  def self.section_text
    GrantFactory::SECTIONS_TEXT.sample
  end

  def self.section_info
    section_text = GrantFactory::SECTIONS_TEXT.sample
    section_title = GrantFactory::SECTIONS_TITLE.sample
    { text: section_text, title: section_title, wordcount: count_words(section_title, section_text) }
  end
end
