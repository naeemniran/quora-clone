require 'byebug'

get '/question/new' do
	erb :"static/question_new"
	#New question form
end

get '/question/:id' do
	@question = Question.find(params[:id])
	erb :"static/question"
end

post '/question' do
	question = Question.new(question: params[:question])
	question.user_id = current_user.id
	if question.save
		redirect "/question/#{question.id}"
	end
end
