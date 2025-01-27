const bedService = require('../services/BedService');

// Get all beds
async function getBeds(request, response) {
    try {
        const beds = await bedService.getBeds();
        response.status(200).json(beds);
    } catch (error) {
        console.error('Error fetching beds:', error);
        response.status(500).json({ message: 'Error fetching beds' });
    }
}

// Get specific bed by bedNo and wardNo
async function getBed(request, response) {
    const { bedNo, wardNo } = request.params;
    try {
        const bed = await bedService.getBed(parseInt(bedNo), wardNo);
        if (!bed || bed.length === 0) {
            response.status(404).json({ message: 'Bed not found' });
        } else {
            response.status(200).json(bed);
        }
    } catch (error) {
        console.error('Error fetching bed:', error);
        response.status(500).json({ message: 'Internal server error' });
    }
}

module.exports = {
    getBeds : getBeds,
    getBed : getBed
};
