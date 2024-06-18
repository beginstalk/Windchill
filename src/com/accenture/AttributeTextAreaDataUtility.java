package com.accenture;

import com.ptc.core.components.descriptor.ModelContext;
import com.ptc.core.components.factory.AbstractDataUtility;
import com.ptc.core.components.factory.dataUtilities.UtilityHelper;
import com.ptc.core.components.rendering.guicomponents.TextArea;

import wt.util.WTException;

public class AttributeTextAreaDataUtility extends AbstractDataUtility {

	public Object getDataValue(String componentId, Object datum, ModelContext mc) throws WTException {

        TextArea textarea = new TextArea();
        textarea.setValue(getAttributeDisplayValue(componentId, componentId, datum, mc));
        textarea.setReadOnly(true);
        textarea.setWidth(35);
        textarea.setHeight(5);
        textarea.setName(componentId);
        return textarea;
    }
    
    public String getAttributeDisplayValue(String attributeName, String componentId, Object datum, ModelContext mc) throws WTException{
        Object rawVal = UtilityHelper.getRawValue(attributeName, datum, mc);
        return UtilityHelper.getStringValue(rawVal, componentId,datum, mc);
    }
}
