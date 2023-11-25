from django.urls import path
from hr_app import views

urlpatterns = [
    path('', views.main, name='main'),
    path('login_code', views.login_code, name='login_code'),
    path('logout', views.logout, name='logout'),
    path('admin_home', views.admin_home, name='admin_home'),
    path('manage_hr', views.manage_hr, name='manage_hr'),
    path('manage_hr_search', views.manage_hr_search, name='manage_hr_search'),
    path('add_hr', views.add_hr, name='add_hr'),
    path('add_hr_action', views.add_hr_action, name='add_hr_action'),
    path('edit_hr/<int:hr_id>', views.edit_hr, name='edit_hr'),
    path('edit_hr_action', views.edit_hr_action, name='edit_hr_action'),
    path('delete_hr/<int:hr_id>', views.delete_hr, name='delete_hr'),
    path('view_selected_candidates', views.view_selected_candidates, name='view_selected_candidates'),
    path('selected_candidates_search', views.selected_candidates_search, name='selected_candidates_search'),
    path('shortlist_details/<int:app_id>', views.shortlist_details, name='shortlist_details'),
    path('shortlist_details_action', views.shortlist_details_action, name='shortlist_details_action'),
    path('view_shortlist_clients', views.view_shortlist_clients, name='view_shortlist_clients'),
    path('shortlisted_search', views.shortlisted_search, name='shortlisted_search'),

    path('view_vacancy_approve', views.view_vacancy_approve, name='view_vacancy_approve'),


    # path('attend_exam/<int:application_id>', views.attend_exam, name='attend_exam'),
    # path('attend_exam_action', views.attend_exam_action, name='attend_exam_action'),
    path('attendmock', views.attendmock, name="attendmock"),
    path('attendtest1', views.attendtest1, name="attendtest1"),
    path('attendtest/<int:vacancy_id>', views.attendtest, name="attendtest"),
    path('atexam', views.atexam, name="atexam"),
    path('candidate_home', views.candidate_home, name='candidate_home'),
    path('view_application_status', views.view_application_status, name='view_application_status'),
    path('view_interview_date', views.view_interview_date, name='view_interview_date'),
    path('view_result', views.view_result, name='view_result'),
    path('vacancy_name_search', views.vacancy_name_search, name='vacancy_name_search'),

    path('view_vacancy', views.view_vacancy, name='view_vacancy'),
    path('send_application/<int:vacancy_id>', views.send_application, name='send_application'),
    path('view_selection_notification', views.view_selection_notification,name='view_selection_notification'),

    path('add_manage_vacancy', views.add_manage_vacancy, name='add_manage_vacancy'),
    path('add_manage_vacancy_search', views.add_manage_vacancy_search, name='add_manage_vacancy_search'),
    path('add_vacancy', views.add_vacancy, name='add_vacancy'),
    path('add_vacancy_action', views.add_vacancy_action, name='add_vacancy_action'),
    path('edit_vacancy/<int:vacancy_id>', views.edit_vacancy, name='edit_vacancy'),
    path('edit_vacancy_action', views.edit_vacancy_action, name='edit_vacancy_action'),
    path('delete_vacancy/<int:vacancy_id>', views.delete_vacancy, name='delete_vacancy'),

    path('add_manage_question', views.add_manage_question, name='add_manage_question'),
    path('question_search', views.question_search, name='question_search'),
    path('add_question', views.add_question, name='add_question'),
    path('add_question_action', views.add_question_action, name='add_question_action'),
    path('edit_question/<int:question_id>', views.edit_question, name="edit_question"),
    path('edit_question_action', views.edit_question_action, name="edit_question_action"),
    path('delete_question/<int:question_id>', views.delete_question, name="delete_question"),
    path('hr_home', views.hr_home, name='hr_home'),
    path('interview_score_update', views.interview_score_update, name='interview_score_update'),
    path('update_score/<int:score_id>', views.update_score, name='update_score'),
    path('update_score_action', views.update_score_action, name='update_score_action'),

    path('view_application', views.view_application, name='view_application'),
    path('view_application_search', views.view_application_search, name='view_application_search'),
    path('accept_applicant/<int:application_id>', views.accept_applicant, name='accept_applicant'),
    path('reject_applicant/<int:application_id>', views.reject_applicant, name='reject_applicant'),

    path('profile', views.profile, name='profile'),
    path('update_profile', views.update_profile, name='update_profile'),
    path('shortlist_vacancy_search', views.shortlist_vacancy_search, name='shortlist_vacancy_search'),
    path('view_shortlist',views.view_shortlist, name='view_shortlist'),
    path('test_result/<int:id>', views.test_result, name='test_result'),
    path('vacancy_search', views.vacancy_search, name='vacancy_search'),
    path('register', views.register, name='register'),
    path('register_action', views.register_action, name='register_action'),
    path('view_selection_notification', views.view_selection_notification, name='view_selection_notification')

]

