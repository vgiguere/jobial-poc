package com.jobial.domain

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-12
 * Time: 9:07 PM
 * To change this template use File | Settings | File Templates.
 */

import com.google.code.morphia.annotations.Entity
import com.google.code.morphia.annotations.Id
import com.domainlanguage.money.Money
import com.jobial.domain.profile.Seniority
import com.jobial.domain.profile.Gender
import com.jobial.domain.profile.Education
import com.jobial.domain.profile.Ethnicity
import com.jobial.domain.profile.SexualOrientation
import com.jobial.domain.profile.City
import com.jobial.domain.profile.Religion
import com.jobial.domain.profile.OnetCode
import com.google.code.morphia.annotations.Serialized

@Entity("Profile")
class Profile {

    @Id
    String email

    OnetCode profession
    Seniority seniority


    int salary

    int yearsExperience
    City city
    Gender gender
    Education education
    Ethnicity ethnicity
    Religion religion
    SexualOrientation sexualOrientation

    BigDecimal applyBigottery(int salary) {
        return salary * this.ethnicity.bigotFactor *  this.city.bigotFactor *   this.gender.bigotFactor *this.education.bigotFactor* this.religion.bigotFactor * this.sexualOrientation.bigotFactor
    }
}