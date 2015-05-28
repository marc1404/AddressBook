package com.vornetran.marc.database;

/**
 * Created by Marc on 30.04.2015.
 */
public class Database {

    private static Sequelize sequelize;

    public static Sequelize get(){
        if(sequelize == null){
            try {
                sequelize = new Sequelize("10.35.4.24", "addressbook", "smcdba", "smcdba");
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }

        return sequelize;
    }

}
