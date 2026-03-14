// accessibility_datatables_plotly.js

$(document).ready(function() {
    
    // Function to add aria-label to datatable page navigation buttons
    
    function addPaginationAriaLabels() {
        $('a.paginate_button').each(function() {
            var ariaLabel = ('Go to data table page ' + $(this).text().trim());
            if(ariaLabel.length > 0) {
                $(this).attr('aria-label', ariaLabel);
            }
        });
    };
    
    // Function to add aria-label to datatable column filter inputs
    
    function addAriaLabelsToFilterInputs() {
    
        $('.dataTable').each(function() {
            var tableId = $(this).attr('id');
            
            if(typeof tableId === "undefined" || tableId === null) {
                return true; // Goes to next iteration if no ID
            }
            
            var dataTable = $('#' + tableId).DataTable();
            var columnHeaders = dataTable.columns().header().toArray();
            
            if(columnHeaders[0].innerText === '' && columnHeaders[1].innerText !== '') {
                var columnHeaders = columnHeaders.slice(1);    
            }
            
            $(this).closest('.dataTables_wrapper').find('thead input[type = "search"].form-control').each(function(index) {
                if($(columnHeaders)[index]) {
                    var headerElement = columnHeaders[index];
                    $(this).attr('aria-label', "Filter for column " + headerElement.innerText); 
                }
            });
        });
    }
    
    // Function to add aria-label to datatable table search/filter input
    
    function addAriaLabelsToSearchbar() {
        $('.dataTable').each(function() {
            var tableId = $(this).attr('id');
            
            if(typeof tableId === "undefined" || tableId === null) {
                return true; // Goes to next iteration if no ID
            }
            
            var targetId = tableId + '_filter';
            var searchBar = $('#' + targetId + '>label>input');
            
            if(searchBar.prop('tagName') === 'INPUT') {
                searchBar.attr('aria-label', 'Enter search text to filter table');
            };
        });
    }
    
    // ------------------------------------------------------------------
    // CALLING THE FUNCTIONS ON INIT AND WHENEVER A DT DRAWS //
    // ------------------------------------------------------------------
    
    // Call the functions initially when the page loads
    
    addPaginationAriaLabels();
    addAriaLabelsToFilterInputs();
    addAriaLabelsToSearchbar();
    
    // Re-run the functions whenever a DataTable is redrawn, sorted, or paged
    
    $(document).on('draw.dt', function() {
        addPaginationAriaLabels();
        addAriaLabelsToFilterInputs();
        addAriaLabelsToSearchbar();
    });
});

// Plotly buttons add aria labels

$(document).on('plotly_afterplot', '.js-plotly-plot', function() {
    // Find modebar button 'a' tags within the plot that just rendered
    $(this).find('.modebar-btn').each(function() {
        var $btn = $(this);
        var title = $btn.attr('data-title');
    
        // Add descriptive ARIA label
        
        if (title && !$btn.attr('aria-label')) {
            $btn.attr('aria-label', title);
        }
    
        // Add role attribute to the buttons and make them focusable via Tab key
        
        $btn.attr({'role': 'button', 'tabindex': '0'});
    });
});

// Global keyboard listener for elements with role="button"
// This ensures Enter and Space trigger the same action as a mouse click

$(document).on('keydown', '[role="button"]', function(e) {
    if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault(); // Prevent page scrolling on Space
        $(this).click();
    }
});
