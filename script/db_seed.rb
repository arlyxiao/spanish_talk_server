ActiveRecord::Base.transaction do

  Question.create(:creator_id => 1, :title => '你很忙吗，怎么翻译', :content => 'estas ocupado?')

  Question.create(:creator_id => 1, :title => '西语有哪些主要的时态', :content => '除了陈述式时代')

  Question.create(:creator_id => 1, :title => '国内西语使用比较多的城市', :content => '北京，上海，广州')

  Question.create(:creator_id => 1, :title => '颤音如何发音', :content => 'RR')

  Question.create(:creator_id => 1, :title => '两个 ll 如何发音', :content => '比如 illa')

  Question.create(:creator_id => 1, :title => '比较好的入门教材', :content => '速成西班牙语')

  Question.create(:creator_id => 1, :title => '南美跟西班牙区别大吗', :content => '在语法跟发音方面')

  Question.create(:creator_id => 1, :title => '智利留学怎么样', :content => '那边教育水平，治安如何')

  Question.create(:creator_id => 1, :title => '求比较好的翻译字典工具', :content => 'google translate')

  Question.create(:creator_id => 1, :title => 'p 跟 b 在发音上的区别大吗', :content => '两者发音好像差不多')

  Question.create(:creator_id => 1, :title => '单词复数有哪些注意的', :content => '除了正常的规则外，有哪些比较特别的')

end