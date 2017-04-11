package ro.unibuc.fmi.messages;

import java.io.Serializable;

/**
 * Created by calin on 11.04.2017.
 */
public class AmIPartner implements Serializable {

    private boolean partner;

    public AmIPartner(boolean partner){
        this.partner = partner;
    }

    public boolean amIPartner(){
        return this.partner;
    }
}
