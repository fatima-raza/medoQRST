const bedoperation = require('../src/services/BedService');

// Test `getBeds`
bedoperation.getBeds()
    .then(result => {
        console.log('All Beds:', result);
    })
    .catch(error => {
        console.error('Error fetching beds:', error);
    });

// Test `getBed`
bedoperation.getBed(1, '002')
    .then(result => {
        console.log('Specific Bed:', result[0]);
    })
    .catch(error => {
        console.error('Error fetching bed:', error);
    });
