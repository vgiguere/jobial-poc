package com.jobial.domain.profile

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-16
 * Time: 8:33 PM
 * To change this template use File | Settings | File Templates.
 */
public enum Education {
    DROPOUT(0.5d), HIGHSCHOOL(0.85), COLLEGE(1.0d), UNIVERSITY(1.2d), GRADUATE(1.40d)

    private Education(double factor){
        this.bigotFactor = factor
    }

    double bigotFactor

}