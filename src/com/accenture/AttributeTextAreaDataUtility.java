package com.accenture;

import com.ptc.core.components.descriptor.ModelContext;
import com.ptc.core.components.factory.AbstractDataUtility;
import com.ptc.core.components.factory.dataUtilities.UtilityHelper;
import com.ptc.core.components.rendering.guicomponents.TextArea;

import wt.util.WTException;

public class AttributeTextAreaDataUtility extends AbstractDataUtility {

	public Object getDataValue(String component_id, Object datum, ModelContext mc) throws WTException {

        TextArea textarea = new TextArea();
        textarea.setValue(getAttributeDisplayValue(component_id, component_id, datum, mc));
        textarea.setReadOnly(true);
        textarea.setWidth(35);
        textarea.setHeight(5);
        textarea.setName(component_id);
        return textarea;
    }
    
    public String getAttributeDisplayValue(String attributeName, String componentId, Object datum, ModelContext mc) throws WTException {
        Object raw_val = UtilityHelper.getRawValue(attributeName, datum, mc);
        String value = UtilityHelper.getStringValue(raw_val, componentId,datum, mc);
        return value;
    }
}
