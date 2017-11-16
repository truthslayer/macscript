'use strict';


const puppeteer = require('puppeteer');
const devices = require('puppeteer/DeviceDescriptors');


var website = 'http://nytimes.com';
var loc = 'nyt-pdf';
    
(async() => {

    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    page.setViewport({
	width: 1620,
        height: 5080
    });
    await page.emulateMedia('screen');
    await page.goto(website,  {
	waitLoad: true, 
	waitNetworkIdle: true // defaults to false
    });
    let height = await page.evaluate(() => document.documentElement.offsetHeight);
    let y = await page.evaluate(() => document.querySelector('button#closeCross.welc-close') );
    await page.screenshot({path: loc + '.png', width: '1600px', height: height + 'px',  fullPage: true, displayHeaderFooter: true, printBackground: true});
    if (y) {
	await  page.click('button#closeCross.welc-close');
    }

    await page.pdf({path: loc + '.pdf',
		    scale: 1,
		    landscape: false,
		    height: height + 'px',
		    width: '1200px',
//		    fullPage: true,
		    displayHeaderFooter: true,
		    printBackground: true});
    await browser.close();

})();
