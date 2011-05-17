package com.jobial.domain.profile

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-16
 * Time: 8:31 PM
 * To change this template use File | Settings | File Templates.
 */
public enum City {

    TORONTO(1.35d),MONTREAL(1.10d),VANCOUVER(1.2d),OTTAWA(0.96d),CALGARY(1.25d),EDMONTON(0.90d),QUEBEC(0.85d),WINNIPEG(0.77d)


    private City(double factor) {
        this.bigotFactor = factor
    }

    double bigotFactor

}