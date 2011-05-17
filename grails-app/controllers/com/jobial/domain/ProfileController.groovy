package com.jobial.domain

import com.jobial.domain.profile.City
import com.jobial.domain.profile.Education
import com.jobial.domain.profile.SexualOrientation
import com.jobial.domain.profile.Religion
import com.jobial.domain.profile.Seniority
import com.jobial.domain.profile.Ethnicity
import com.jobial.domain.profile.Gender
import com.jobial.domain.profile.OnetCode
import com.mongodb.BasicDBObject
import com.mongodb.DBObject
import com.google.code.morphia.MapreduceResults
import com.mongodb.DBCollection
import com.mongodb.MapReduceCommand
import com.mongodb.MapReduceOutput

class ProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def mongo

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = 30
        [profileInstanceList: Profile.list(params), profileInstanceTotal: Profile.count()]
    }

    def create = {
        def profileInstance = new Profile()
        profileInstance.properties = params
        return [profileInstance: profileInstance]
    }

    def search = {
        def profile = new Profile()
        return [profileInstance: profile]
    }


    def doSearch = {




        String mapFunction = """function(){
        if(this.religion == ${params.religion}){
            emit(this.email,{salary:this.salary})
            }
        }"""
        String reduceFunction = """function(key,values){
        var n = {count:0,sum:0}
        for ( var i = 0; i < values.length; i++ ){
              n.sum += values[i].salary;
              n.count ++;
             }
         return n

        }"""

        String finalizeFunction = """function(key, value){
               value.avg = value.sum / value.count;
               return value;

       }"""


        MapReduceCommand command = new MapReduceCommand(Profile.collection, mapFunction, reduceFunction, null, MapReduceCommand.OutputType.INLINE,null)
        command.setFinalize(finalizeFunction)


        MapReduceOutput out =  Profile.collection.mapReduce(command)

        for(DBObject o : out.results()){

            println o
        }

        def profile = new Profile()
        return [view:'search', profileInstance: profile]

    }

    def save = {
        def profileInstance = new Profile(params)
        if (profileInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.email])}"
            redirect(action: "show", id: profileInstance.email)
        }
        else {
            render(view: "create", model: [profileInstance: profileInstance])
        }
    }

    def show = {
        def profileInstance = Profile.get(params.id)
        if (!profileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
        else {
            [profileInstance: profileInstance]
        }
    }

    def edit = {
        def profileInstance = Profile.get(params.id)
        if (!profileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [profileInstance: profileInstance]
        }
    }

    def update = {
        def profileInstance = Profile.get(params.id)
        if (profileInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (profileInstance.version > version) {

                    profileInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'profile.label', default: 'Profile')] as Object[], "Another user has updated this Profile while you were editing")
                    render(view: "edit", model: [profileInstance: profileInstance])
                    return
                }
            }
            profileInstance.properties = params
            if (!profileInstance.hasErrors() && profileInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'profile.label', default: 'Profile'), profileInstance.id])}"
                redirect(action: "show", id: profileInstance.id)
            }
            else {
                render(view: "edit", model: [profileInstance: profileInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def profileInstance = Profile.get(params.id)
        if (profileInstance) {
            try {
                profileInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])}"
            redirect(action: "list")
        }
    }


    def generate = {
        Random salaryRandom = new Random()
        (1..1000000).each {i ->
            Profile profile = new Profile()
            profile.email = "member_$i@publicprivatecareer.com"
            profile.city = randomFrom(City)
            profile.profession = randomFrom(OnetCode)
            profile.education = randomFrom(Education)
            profile.ethnicity = randomFrom(Ethnicity)
            profile.gender = randomFrom(Gender)
            profile.salary = new BigDecimal(salaryRandom.nextInt(250000))
            profile.sexualOrientation = randomFrom(SexualOrientation)
            profile.religion = randomFrom(Religion)
            profile.seniority = randomFrom(Seniority)
            if (profile.validate()) {
                if (profile.save()) {
                    println "saved profile with email ${profile.email}"
                } else {
                    println "could not save profile with email : ${profile.email}"
                }
            } else {
                println "does not validate!"
            }

        }
        redirect(action: list)

    }

    def randomFrom(def enumType) {
        def list = enumType.values().toList()
        return list[new Random().nextInt(list.size())]
    }
}
