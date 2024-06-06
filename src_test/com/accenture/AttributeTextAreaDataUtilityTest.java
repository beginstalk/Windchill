package com.accenture;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import org.junit.Before;
import org.junit.Test;

import com.accenture.AttributeTextAreaDataUtility;
import com.ptc.core.components.descriptor.ModelContext;
import com.ptc.core.components.factory.dataUtilities.UtilityHelper;
import com.ptc.core.components.rendering.guicomponents.TextArea;

import wt.util.WTException;

public class AttributeTextAreaDataUtilityTest {

    private AttributeTextAreaDataUtility utility;
    private ModelContext mockModelContext;

    @Before
    public void setUp() {
        utility = new AttributeTextAreaDataUtility();
        mockModelContext = mock(ModelContext.class);
    }

	@Test
    public void testGetDataValue() throws WTException {
        // Mock data
        String componentId = "testComponent";
        String attributeName = "testAttribute";
        Object datum = new Object();

        // Mock the behavior of UtilityHelper.getRawValue
        when(UtilityHelper.getRawValue(anyString(), any(), any(ModelContext.class))).thenReturn("Test Value");
        // Test
        Object result = utility.getDataValue(componentId, datum, mockModelContext);

        // Verify that TextArea object is returned
        assertEquals(TextArea.class, result.getClass());

        // Verify that TextArea properties are set correctly
        TextArea textArea = (TextArea) result;
        assertEquals(componentId, textArea.getName());
        assertEquals("Test Value", textArea.getValue());
        assertEquals(true, textArea.isReadOnly());
        assertEquals(35, textArea.getWidth());
        assertEquals(5, textArea.getHeight());
    }

    @Test
    public void testGetAttributeDisplayValue() throws WTException {
        // Mock data
        String attributeName = "testAttribute";
        String componentId = "testComponent";
        Object datum = new Object();

        // Mock the behavior of UtilityHelper.getStringValue
        when(UtilityHelper.getStringValue(any(), anyString(), any(), any(ModelContext.class))).thenReturn("Test Value");

        // Test
        String result = utility.getAttributeDisplayValue(attributeName, componentId, datum, mockModelContext);

        // Verify that the correct value is returned
        assertEquals("Test Value", result);
    }
}
