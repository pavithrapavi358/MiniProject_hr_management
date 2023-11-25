from datetime import datetime

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.db.models import Sum

# Create your views here.
from django.utils.datetime_safe import strftime

from hr_app.models import *


def main(request):
    return render(request, 'login/login_index.html')


def login_code(request):
    try:
        username = request.POST['Username']
        password = request.POST['Password']
        ob = Login.objects.get(username=username, password=password)
        if ob.type == "admin":
            auth_obj = auth.authenticate(username='admin', password='admin')
            if auth_obj is not None:
                auth.login(request, auth_obj)
            return HttpResponse('''<script>alert("Successfully Login");window.location="/admin_home"</script>''')
        elif ob.type == "hr":
            auth_obj = auth.authenticate(username='admin', password='admin')
            if auth_obj is not None:
                auth.login(request, auth_obj)
            request.session['hr_id'] = ob.id
            return HttpResponse('''<script>alert("successfully login");window.location="/hr_home"</script>''')
        elif ob.type == "candidate":
            auth_obj = auth.authenticate(username='admin', password='admin')
            if auth_obj is not None:
                auth.login(request, auth_obj)
            request.session['candidate_id'] = ob.id
            request.session['cnt'] = 0
            return HttpResponse('''<script>alert("successfully login");window.location="/candidate_home"</script>''')

    except:
        return HttpResponse('''<script>alert("invalid username or password");window.location="/"</script>''')


def logout(request):
    auth.logout(request)
    return HttpResponse('''<script>alert("Logouted Successfully");window.location='/'</script> ''')


@login_required(login_url='/')
def admin_home(request):
    return render(request, 'admin/admin_home.html')


@login_required(login_url='/')
def manage_hr(request):
    hr_obj = Hr.objects.all()
    return render(request, 'admin/manage_hr.html', {'hr_obj': hr_obj})


@login_required(login_url='/')
def manage_hr_search(request):
    search = request.POST['search']
    hr_obj = Hr.objects.filter(name__istartswith=search)
    return render(request, 'admin/manage_hr.html', {'hr_obj': hr_obj, 'search': search})


@login_required(login_url='/')
def add_hr(request):
    return render(request, 'admin/add_hr.html')


@login_required(login_url='/')
def add_hr_action(request):
    name = request.POST['Name']
    place = request.POST['Place']
    post = request.POST['Post']
    pin = request.POST['Pin']
    phone = request.POST['Phone']
    dep = request.POST['dep']
    email = request.POST['Email']
    photo = request.FILES['Photo']
    fss = FileSystemStorage()
    photo_file = fss.save(photo.name, photo)
    password = request.POST['Password']
    username = request.POST['username']

    login_obj = Login()
    login_obj.username = username
    login_obj.password = password
    login_obj.type = "hr"
    login_obj.save()

    hr_obj = Hr()
    hr_obj.name = name
    hr_obj.deparment = dep
    hr_obj.place = place
    hr_obj.post = post
    hr_obj.pin = pin
    hr_obj.phone = phone
    hr_obj.photo = photo_file
    hr_obj.phone = phone
    hr_obj.email = email
    hr_obj.LOGIN = login_obj
    hr_obj.save()
    return HttpResponse('''<script>alert("successfully added");window.location="/manage_hr#about"</script>''')


@login_required(login_url='/')
def edit_hr(request, hr_id):
    request.session['hr_id'] = hr_id
    hr_obj = Hr.objects.get(id=hr_id)
    return render(request, "admin/edit_hr.html", {'hr_obj': hr_obj})


@login_required(login_url='/')
def edit_hr_action(request):
    name = request.POST['Name']
    place = request.POST['Place']
    post = request.POST['Post']
    pin = request.POST['Pin']
    phone = request.POST['Phone']
    dep = request.POST['dep']
    email = request.POST['Email']
    if 'Photo' in request.FILES:
        photo = request.FILES['Photo']
        fss = FileSystemStorage()
        photo_file = fss.save(photo.name, photo)

        hr_obj = Hr.objects.get(id=request.session['hr_id'])
        hr_obj.name = name
        hr_obj.place = place
        hr_obj.post = post
        hr_obj.pin = pin
        hr_obj.phone = phone
        hr_obj.deparment = dep
        hr_obj.photo = photo_file
        hr_obj.phone = phone
        hr_obj.email = email
        hr_obj.save()
    else:
        hr_obj = Hr.objects.get(id=request.session['hr_id'])
        hr_obj.name = name
        hr_obj.place = place
        hr_obj.post = post
        hr_obj.pin = pin
        hr_obj.phone = phone
        hr_obj.deparment = dep

        hr_obj.phone = phone
        hr_obj.email = email
        hr_obj.save()
    return HttpResponse('''<script>alert("successfully updated");window.location="/manage_hr#about"</script>''')


@login_required(login_url='/')
def delete_hr(request, hr_id):
    hr_obj = Hr.objects.get(id=hr_id)
    login_obj = Login.objects.get(id=hr_obj.LOGIN.id)
    login_obj.delete()
    return HttpResponse('''<script>alert("successfully deleted");window.location="/manage_hr#about"</script>''')


@login_required(login_url='/')
def view_selected_candidates(request):
    interview_obj = Interview.objects.filter(status="selected")
    return render(request, 'admin/view selected candidates.html', {'interview_obj': interview_obj})


@login_required(login_url='/')
def selected_candidates_search(request):
    name = request.POST['textfield']
    interview_obj = Interview.objects.filter(status="selected", APPLICATION__VACANCY__vacancy_name__istartswith=name)
    return render(request, 'admin/view selected candidates.html', {'interview_obj': interview_obj, 'search': name})


@login_required(login_url='/')
def view_shortlist_clients(request):
    exam_obj = Application.objects.filter(status="shortlisted")
    return render(request, 'admin/view shortlist clients.html', {'exam_obj': exam_obj})


@login_required(login_url='/')
def shortlisted_search(request):
    name = request.POST['Name']
    exam_obj = AttendExam.objects.filter(status="shortlisted", CANDIDATE__name__istartswith=name)
    return render(request, 'admin/view shortlist clients.html', {'exam_obj': exam_obj, 'search': name})


@login_required(login_url='/')
def view_vacancy_approve(request):
    vacancy_obj = Vacancy.objects.all()
    return render(request, 'admin/view vacancy.html', {'vacancy_obj': vacancy_obj})


# ///////////////////////////// HR ////////////////////////////////////////////


@login_required(login_url='/')
def hr_home(request):
    return render(request, 'hr/hr home.html')


@login_required(login_url='/')
def add_manage_vacancy(request):
    vacancy_obj = Vacancy.objects.filter(HR__LOGIN_id=request.session['hr_id'])
    return render(request, 'hr/add & manage vacancy.html', {'vacancy_obj': vacancy_obj})


@login_required(login_url='/')
def add_manage_vacancy_search(request):
    vacancy = request.POST['vacancy_name']
    vacancy_obj = Vacancy.objects.filter(vacancy_name__istartswith=vacancy)
    return render(request, 'hr/add & manage vacancy.html', {'vacancy_obj': vacancy_obj, 'vacancy': vacancy})


@login_required(login_url='/')
def add_vacancy(request):
    return render(request, 'hr/add vacancy.html')


@login_required(login_url='/')
def add_vacancy_action(request):
    vacancy_name = request.POST['Vacancy_name']
    no_of_vacancy = request.POST['No_of_Vacancy']
    vacancy_details = request.POST['Vacancy_Details']
    qualification = request.POST['Qualification']
    date = request.POST['date']
    time = request.POST['time']
    vacancy_obj = Vacancy()
    vacancy_obj.vacancy_name = vacancy_name
    vacancy_obj.no_of_vacancy = no_of_vacancy
    vacancy_obj.Vacancy_details = vacancy_details
    vacancy_obj.date = datetime.today()
    vacancy_obj.Qualification = qualification
    vacancy_obj.tdate = date
    vacancy_obj.ttime = time
    vacancy_obj.HR = Hr.objects.get(LOGIN_id=request.session['hr_id'])
    vacancy_obj.save()
    return HttpResponse('''<script>alert("successfully added");window.location="/add_manage_vacancy#about"</script>''')


@login_required(login_url='/')
def edit_vacancy(request, vacancy_id):
    request.session['vacancy_id'] = vacancy_id
    vacancy_obj = Vacancy.objects.get(id=vacancy_id)
    return render(request, "hr/edit vacancy.html", {'vacancy_obj': vacancy_obj,"d":str(vacancy_obj.tdate),"t":str(vacancy_obj.ttime)})


@login_required(login_url='/')
def edit_vacancy_action(request):
    vacancy_name = request.POST['Vacancy_name']
    no_of_vacancy = request.POST['No_of_Vacancy']
    vacancy_details = request.POST['Vacancy_Details']
    qualification = request.POST['Qualification']
    time = request.POST['time']
    date = request.POST['date']
    vacancy_obj = Vacancy.objects.get(id=request.session['vacancy_id'])
    vacancy_obj.vacancy_name = vacancy_name
    vacancy_obj.no_of_vacancy = no_of_vacancy
    vacancy_obj.Vacancy_details = vacancy_details
    vacancy_obj.tdate = date
    vacancy_obj.ttime = time
    vacancy_obj.date = datetime.today()
    vacancy_obj.Qualification = qualification
    vacancy_obj.save()
    return HttpResponse('''<script>alert("successfully edited");window.location="/add_manage_vacancy#about"</script>''')


@login_required(login_url='/')
def delete_vacancy(request, vacancy_id):
    vacancy_obj = Vacancy.objects.get(id=vacancy_id)
    vacancy_obj.delete()
    return HttpResponse('''<script>alert("successfully deleted");
    window.location="/add_manage_vacancy#about"</script>''')


@login_required(login_url='/')
def add_manage_question(request):
    question_obj = Question.objects.filter(VACANCY__HR__LOGIN_id=request.session['hr_id'])
    return render(request, 'hr/add&manage question.html', {'question_obj': question_obj})


@login_required(login_url='/')
def question_search(request):
    vacancy = request.POST['vacancy']
    question_obj = Question.objects.filter(VACANCY__vacancy_name__istartswith=vacancy)
    return render(request, 'hr/add&manage question.html', {'question_obj': question_obj, 'search': vacancy})


@login_required(login_url='/')
def add_question(request):
    vacancy_obj = Vacancy.objects.filter(HR__LOGIN_id=request.session['hr_id'])
    return render(request, 'hr/add question.html', {'vacancy_obj': vacancy_obj})


@login_required(login_url='/')
def add_question_action(request):
    vacancy_id = request.POST['vacancy']
    question = request.POST['Question']
    option1 = request.POST['option1']
    option2 = request.POST['option2']
    option3 = request.POST['option3']
    option4 = request.POST['option4']
    answer = request.POST['Answer']

    question_obj = Question()
    question_obj.VACANCY = Vacancy.objects.get(id=vacancy_id)
    question_obj.questions = question
    question_obj.op1 = option1
    question_obj.op2 = option2
    question_obj.op3 = option3
    question_obj.op4 = option4
    question_obj.Answers = answer
    question_obj.save()
    return HttpResponse('''<script>alert("successfully added");window.location="/add_manage_question#about"</script>''')


@login_required(login_url='/')
def edit_question(request, question_id):
    request.session['question_id'] = question_id
    vacancy_obj = Vacancy.objects.all()
    question_obj = Question.objects.get(id=question_id)
    return render(request, 'hr/edit question.html', {'question_obj': question_obj, 'vacancy_obj': vacancy_obj})


@login_required(login_url='/')
def edit_question_action(request):
    vacancy_id = request.POST['vacancy']
    question = request.POST['Question']
    option1 = request.POST['option1']
    option2 = request.POST['option2']
    option3 = request.POST['option3']
    option4 = request.POST['option4']
    answer = request.POST['Answer']

    question_obj = Question.objects.get(id=request.session['question_id'])
    question_obj.VACANCY = Vacancy.objects.get(id=vacancy_id)
    question_obj.questions = question
    question_obj.op1 = option1
    question_obj.op2 = option2
    question_obj.op3 = option3
    question_obj.op4 = option4
    question_obj.Answers = answer
    question_obj.save()
    return HttpResponse('''<script>alert("successfully updated");
    window.location="/add_manage_question#about"</script>''')


@login_required(login_url='/')
def delete_question(request, question_id):
    question_obj = Question.objects.get(id=question_id)
    question_obj.delete()
    return HttpResponse('''<script>alert("successfully deleted");
    window.location="/add_manage_question#about"</script>''')


@login_required(login_url='/')
def view_application(request):
    application_obj = Application.objects.filter(VACANCY__HR__LOGIN=request.session['hr_id'])
    return render(request, 'hr/view application.html', {'application_obj': application_obj})


@login_required(login_url='/')
def view_application_search(request):
    applicant = request.POST['Applicant']
    application_obj = Application.objects.filter(VACANCY__HR__LOGIN=request.session['hr_id'],
                                                 CANDIDATE__name__istartswith=applicant)
    return render(request, 'hr/view application.html', {'application_obj': application_obj, 'search': applicant})


@login_required(login_url='/')
def accept_applicant(request, application_id):
    application_obj = Application.objects.get(id=application_id)
    application_obj.status = "accepted"
    application_obj.save()
    return HttpResponse('''<script>alert("Application accepted");window.location="/view_application#about"</script>''')


@login_required(login_url='/')
def reject_applicant(request, application_id):
    application_obj = Application.objects.get(id=application_id)
    application_obj.status = "rejected"
    application_obj.save()
    return HttpResponse('''<script>alert("Application rejected");window.location="/view_application#about"</script>''')


@login_required(login_url='/')
def interview_score_update(request):
    interview_obj = Interview.objects.filter(status="scheduled")
    return render(request, 'hr/interview score update.html', {'interview_obj': interview_obj})


@login_required(login_url='/')
def update_score(request, score_id):
    request.session['score_id'] = score_id
    return render(request, 'hr/update score.html')


def update_score_action(request):
    score = request.POST['textfield']
    status = request.POST['Status']
    interview_obj = Interview.objects.get(id=request.session['score_id'])
    interview_obj.score = score
    interview_obj.status = status
    interview_obj.save()
    application_obj = Application.objects.get(id=interview_obj.APPLICATION.id)
    print("#######################", application_obj)
    application_obj.status = 'selected'
    application_obj.save()
    return HttpResponse('''<script>alert("Score updated");window.location="/interview_score_update#about"</script>''')


def shortlist_vacancy_search(request):
    vacancy_obj = Vacancy.objects.filter(HR__LOGIN_id=request.session['hr_id'])
    return render(request, 'hr/shortlist_vacancy_search.html', {'vacancy_obj': vacancy_obj})


@login_required(login_url='/')
def view_shortlist(request):
    vacancy = request.POST['select']
    exam_obj = Application.objects.filter(status="shortlisted", VACANCY_id=vacancy)
    for i in exam_obj:
        short = i.id
        interview_obj = Interview.objects.filter(APPLICATION_id=short, status="scheduled")
        if len(interview_obj) == 0:
            i.interview = "0"
        else:
            i.interview = "1"
    return render(request, 'hr/view shortlist.html', {'exam_obj': exam_obj})


def shortlist_details(request, app_id):
    request.session['app_id'] = app_id
    date = datetime.now().strftime("%Y-%m-%d")
    return render(request, "hr/shortlist_details.html", {'dt': date})


def shortlist_details_action(request):
    venue = request.POST['Venue']
    date = request.POST['Date']
    time = request.POST['Time']
    interview_obj = Interview()
    interview_obj.venue = venue
    interview_obj.date = date
    interview_obj.time = time
    interview_obj.status = "scheduled"
    interview_obj.score = 0
    interview_obj.APPLICATION = Application.objects.get(id=request.session['app_id'])
    interview_obj.save()
    return HttpResponse('''<script>alert("successful");window.location="/shortlist_vacancy_search#about"</script>''')


@login_required(login_url='/')
def test_result(request, id):
    request.session['vid'] = id
    ob = Application.objects.filter(status='accepted', VACANCY__id=id)
    for i in ob:
        obm = AttendExam.objects.filter(QUESTION__VACANCY__id=i.VACANCY.id,
                                        CANDIDATE__id=i.CANDIDATE.id).aggregate(total_sum=Sum('Mark'))
        i.mark = obm['total_sum']
    return render(request, 'hr/test result.html', {'exam_obj': ob})


@login_required(login_url='/')
def vacancy_search(request):
    aids = request.POST.getlist("cb")
    for i in aids:
        ob = Application.objects.get(id=i)
        ob.status = "shortlisted"
        ob.save()
    return redirect("/add_manage_vacancy")


@login_required(login_url='/')
def candidate_home(request):
    return render(request, 'candidate/candidate home.html')


@login_required(login_url='/')
def view_application_status(request):
    application_obj = Application.objects.filter(CANDIDATE__LOGIN_id=request.session['candidate_id'])
    for i in application_obj:
        vi = i.VACANCY.id
        ob = AttendExam.objects.filter(CANDIDATE__LOGIN__id=request.session['candidate_id'], QUESTION__VACANCY__id=vi)
        if len(ob) == 0:
            d=str(i.VACANCY.tdate)
            t=str(i.VACANCY.ttime)

            fmt = '%Y-%m-%d %H:%M:%S'
            d1 = datetime.strptime(d+" "+t.split('.')[0], fmt)
            d2 = datetime.strptime(datetime.now().strftime("%Y-%m-%d %H:%M:%S"), fmt)

            diff = d1 - d2
            diff = (diff.days * 24 * 60) + (diff.seconds / 60)
            if diff<15 and diff>-15:
                i.ast = "0"
            elif diff >15:
                i.ast="Test start on "+d+" @ "+t.split('.')[0]
            else:
                i.ast="Test over"
        else:
            i.ast = "1"
    return render(request, 'candidate/view application status.html', {'application_obj': application_obj})


@login_required(login_url='/')
def attendmock(request):
    return render(request, "candidate/attendmocktest.html")


@login_required(login_url='/')
def attendtest(request, vacancy_id):
    try:
        request.session['cnt'] = 0
        request.session['vacancy_id'] = vacancy_id
        cnt = 0

        ob = Question.objects.filter(VACANCY_id=vacancy_id)
        q = []
        for i in ob:
            q.append(i.id)
        res1 = Question.objects.get(id=q[cnt])
        return render(request, 'candidate/attendtest.html', {'data': res1, 'ln': len(ob), 'ss': int(len(ob)-1),
                                                         'cnt': int(cnt)})
    except:
        return HttpResponse('''<script>alert("sorry questions did not added ");
        window.location="/candidate_home#about"</script>''')


@login_required(login_url='/')
def attendtest1(request):
    cnt = request.session['cnt']
    vacancy_id = request.session['vacancy_id']
    ob = Question.objects.filter(VACANCY_id=vacancy_id)
    q = []
    for i in ob:
        q.append(i.id)
    res1 = Question.objects.get(id=q[cnt])
    return render(request, 'candidate/attendtest.html', {'data': res1, 'ln': len(ob), 'ss': int(len(ob)-1),
                                                         'cnt': int(cnt)})


@login_required(login_url='/')
def atexam(request):
    q = request.POST['q']
    btn = request.POST['button']
    ans = request.POST['radiobutton']
    print(q)
    print(ans)
    if btn == "FINISH":
        request.session['cnt'] = 0
        obb = Question.objects.get(id=q)
        if obb.Answers == ans:
            ob = AttendExam()
            ob.Mark = 1
            ob.date = datetime.today()
            ob.CANDIDATE = Candidate.objects.get(LOGIN_id=request.session['candidate_id'])
            ob.QUESTION = Question.objects.get(id=q)
            ob.save()
            return HttpResponse('''<script>alert("succesfully attended");
            window.location="/candidate_home#about"</script>''')
        else:
            ob = AttendExam()
            ob.Mark = 0
            ob.date = datetime.today()
            ob.CANDIDATE = Candidate.objects.get(LOGIN_id=request.session['candidate_id'])
            ob.QUESTION = Question.objects.get(id=q)
            ob.save()
            return HttpResponse('''<script>alert("successfully attended");
            window.location="/candidate_home#about"</script>''')
    else:
            request.session['cnt'] = request.session['cnt'] + 1
            obb = Question.objects.get(id=q)
            if obb.Answers == ans:
                ob = AttendExam()
                ob.Mark = 1
                ob.date = datetime.today()
                ob.CANDIDATE = Candidate.objects.get(LOGIN_id=request.session['candidate_id'])
                ob.QUESTION = Question.objects.get(id=q)
                ob.save()
                return redirect('attendtest1')
            else:
                ob = AttendExam()
                ob.Mark = 0
                ob.date = datetime.today()
                ob.CANDIDATE = Candidate.objects.get(LOGIN_id=request.session['candidate_id'])
                ob.QUESTION = Question.objects.get(id=q)
                ob.save()
                return redirect('attendtest1')


@login_required(login_url='/')
def view_interview_date(request):
    interview_obj = Interview.objects.filter(APPLICATION__CANDIDATE__LOGIN_id=request.session['candidate_id'],
                                             status="scheduled")
    return render(request, 'candidate/view interview date.html', {'interview_obj': interview_obj})


@login_required(login_url='/')
def view_result(request):
    ob = Application.objects.filter(CANDIDATE__LOGIN__id=request.session['candidate_id'])
    for i in ob:
        obm = AttendExam.objects.filter(QUESTION__VACANCY__id=i.VACANCY.id, CANDIDATE__LOGIN_id=request.session['candidate_id']).aggregate(total_sum=Sum('Mark'))
        i.mark = obm['total_sum']
    return render(request, 'candidate/view result.html', {'result_obj': ob})


def vacancy_name_search(request):
    search = request.POST['vacancy_name']
    ob = Application.objects.filter(CANDIDATE__LOGIN__id=request.session['candidate_id'])
    for i in ob:
        obm = AttendExam.objects.filter(QUESTION__VACANCY__id=i.VACANCY.id, QUESTION__VACANCY__vacancy_name__istartswith=search,
                                        CANDIDATE__LOGIN_id=request.session['candidate_id']).aggregate(total_sum=Sum('Mark'))
        i.mark = obm['total_sum']

    return render(request, 'candidate/view result.html', {'result_obj': ob, 'vacancy': search})


@login_required(login_url='/')
def view_vacancy(request):
    vacancy_obj = Vacancy.objects.all()
    for i in vacancy_obj:
        vi = i.id
        ob = Application.objects.filter(CANDIDATE__LOGIN_id=request.session['candidate_id'], VACANCY_id=vi)
        if len(ob) == 0:
            i.ast = "0"
        else:
            i.ast = "1"
    return render(request, 'candidate/view vacancy.html', {'vacancy_obj': vacancy_obj})


@login_required(login_url='/')
def send_application(request, vacancy_id):
    request.session['vacancy_id'] = vacancy_id
    application_obj = Application()
    application_obj.VACANCY = Vacancy.objects.get(id=vacancy_id)
    application_obj.CANDIDATE = Candidate.objects.get(LOGIN_id=request.session['candidate_id'])
    application_obj.date = datetime.now()
    application_obj.status = "pending"
    application_obj.save()
    return HttpResponse('''<script>alert("Application sent  successfully");
    window.location="/view_vacancy#about"</script>''')


@login_required(login_url='/')
def view_selection_notification(request):
    interview_obj = Interview.objects.filter(APPLICATION__CANDIDATE__LOGIN_id=request.session['candidate_id'])
    return render(request, 'candidate/view selection notification.html', {'interview_obj': interview_obj})


@login_required(login_url='/')
def profile(request):
    ob=Candidate.objects.get(LOGIN__id=request.session['candidate_id'])
    return render(request, 'candidate/profile.html',{"i":ob})


def register(request):
    return render(request, 'candidate/registration.html')


def register_action(request):
    name = request.POST['name']
    place = request.POST['place']
    post = request.POST['post']
    pin = request.POST['pin']
    phone = request.POST['phone']
    email = request.POST['email']
    qualification = request.POST['qualification']
    photo = request.FILES['photo']
    proof = request.FILES['proof']
    fs = FileSystemStorage()
    proof_file = fs.save(proof.name, proof)
    photo_file = fs.save(photo.name, photo)
    username = request.POST['username']
    password = request.POST['password']

    login_obj = Login()
    login_obj.username = username
    login_obj.password = password
    login_obj.type = "candidate"
    login_obj.save()

    candidate_obj = Candidate()
    candidate_obj.name = name
    candidate_obj.place = place
    candidate_obj.post = post
    candidate_obj.pin = pin
    candidate_obj.phone = phone
    candidate_obj.email = email
    candidate_obj.qualification = qualification
    candidate_obj.proof = proof_file
    candidate_obj.photo = photo_file
    candidate_obj.LOGIN = login_obj
    candidate_obj.save()
    return HttpResponse('''<script>alert("registration completed successfully");window.location="/"</script>''')
@login_required(login_url='/')

def update_profile(request):
    name = request.POST['name']
    place = request.POST['place']
    post = request.POST['post']
    pin = request.POST['pin']
    phone = request.POST['phone']
    email = request.POST['email']
    qualification = request.POST['qualification']
    # photo = request.FILES['photo']
    # proof = request.FILES['proof']
    # fs = FileSystemStorage()
    # proof_file = fs.save(proof.name, proof)
    # photo_file = fs.save(photo.name, photo)



    candidate_obj = Candidate.objects.get(LOGIN__id=request.session['candidate_id'])
    candidate_obj.name = name
    candidate_obj.place = place
    candidate_obj.post = post
    candidate_obj.pin = pin
    candidate_obj.phone = phone
    candidate_obj.email = email
    candidate_obj.qualification = qualification
    try:
        photo = request.FILES['photo']

        fs = FileSystemStorage()

        photo_file = fs.save(photo.name, photo)
        candidate_obj.photo = photo_file

    except:
        pass
    try:
        proof = request.FILES['proof']
        fs = FileSystemStorage()
        proof_file = fs.save(proof.name, proof)
        candidate_obj.proof = proof_file
    except:
        pass

    candidate_obj.save()
    return HttpResponse('''<script>alert("Updated Successfully");window.location="/profile#about"</script>''')
