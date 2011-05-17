package com.jobial.domain.profile

/**
 * Created by IntelliJ IDEA.
 * User: vincentgiguere
 * Date: 11-05-16
 * Time: 8:34 PM
 * To change this template use File | Settings | File Templates.
 */
enum Religion {

    CHRISTIANITY(1.10d),
    ISLAM(1d),
    BUDDHISM(0.9d),
    HINDUISM(0.74d),
    JUDAISM(1.5d),
    ATHEISM(1.25d)

    private Religion(double factor){
        this.bigotFactor = factor
    }

       double bigotFactor

}
