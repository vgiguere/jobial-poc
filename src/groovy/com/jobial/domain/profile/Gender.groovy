package com.jobial.domain.profile

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-16
 * Time: 8:33 PM
 * To change this template use File | Settings | File Templates.
 */
enum Gender {

    MALE(1.22d),FEMALE(0.9d)

     private Gender(double factor){
        this.bigotFactor = factor
    }

    double bigotFactor
}
