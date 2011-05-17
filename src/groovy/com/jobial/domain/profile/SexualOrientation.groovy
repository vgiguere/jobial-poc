package com.jobial.domain.profile

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-16
 * Time: 8:38 PM
 * To change this template use File | Settings | File Templates.
 */
enum SexualOrientation {

    HETEROSEXUAL(1.0d),HOMOSEXUAL(1.10d),BISEXUAL(1.20d)

    private SexualOrientation(double factor){
        this.bigotFactor = factor
    }

       double bigotFactor
}
