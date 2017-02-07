class HomeController < ApplicationController
  def index
  	# @galleries = Gallery.all
  	guid = 'd5e873f2-74c9-458b-8051-a62e2106db43'
  	pass1 = '@1234qwerasdfzxcv'
  	pass2 = '@zxcvasdfqwer1234'
  	amount1 = '10000000'
  	amount2 = '400000'
  	addr1 = '1FuNM4VLDtS5ESqu3FFWBkaSAnnyYEauhV'
  	addr2 = '1HERCmfoJ8vn5ux6YyQeAVkNsYcyUQVzPJ'

  	# url = "http://localhost:3000/merchant/#{guid}/sendmany?password=#{pass1}&second_password=#{pass2}&recipients=#{recipients}"

  	request = Typhoeus.get("https://api.blockchain.info/v2/#{guid}/list", followlocation: true)
  	@response_body = request.request.response.response_body
  	binding.pry
  end
end
