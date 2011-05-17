package com.jobial.domain.profile

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-16
 * Time: 8:36 PM
 * To change this template use File | Settings | File Templates.
 */
enum Ethnicity  {
    CAUCASIAN(1.24d),HISPANIC(0.89d),AFRICAN(0.65d), ASIAN(1.10d), ARAB(0.9d), PERSIAN(0.95d), KURD(0.7d),INDIAN(0.72d)

    private Ethnicity(double factor){
        this.bigotFactor = factor
    }

    double bigotFactor

}
