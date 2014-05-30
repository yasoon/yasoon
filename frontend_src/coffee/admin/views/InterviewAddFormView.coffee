define(
  [
    'text!admin/templates/newInterviewTpl.htm'
    'admin/views/InterviewsQuestionsView'
    'admin/views/InterviewView'
    'backbone'
    'stickit'
  ]
  (
    newInterviewTpl
    InterviewsQuestionsView
    InterviewView
  )->
    class InterviewAddForm extends InterviewView
      template: _.template(newInterviewTpl)
)