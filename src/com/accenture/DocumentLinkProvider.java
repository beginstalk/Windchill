package com.accenture;
 
import com.ptc.netmarkets.util.beans.NmCommandBean;
import wt.util.WTException;
import wt.doc.WTDocument;
import wt.preference.PreferenceClient;
import wt.preference.PreferenceHelper;

public class DocumentLinkProvider {
	
    public String getLink(NmCommandBean nmCommandBean) throws WTException {
		WTDocument wtDocument = (WTDocument) nmCommandBean.getPrimaryOid().getRefObject();
		return getPreferenceValue() + getDocumentNo(wtDocument);
	}
	
	public  String getPreferenceValue() throws WTException{
		Object preferenceValue = new Object();
		try {
			preferenceValue = PreferenceHelper.service.getValue("Accenture/Interfaces/GoogleURL",PreferenceClient.WINDCHILL_CLIENT_NAME);
		} catch (WTException e) {
			e.printStackTrace();
		}
		return (String) preferenceValue;
	}
	
	public String getDocumentNo(WTDocument  wtDocument) {
		return wtDocument.getNumber();
	}

}