'use strict';

//const options = { executablePath: '/Applications/Google\ Chrome\ Canary/Contents/MacOS/Google\ Chrome\ Canary' };
//const browser = await puppeteer.launch(options);
const puppeteer = require('puppeteer');
const devices = require('puppeteer/DeviceDescriptors');


// print process.argv
var args = process.argv.slice(2);
if (args.length < 2) {
    console.log('Error, we need a name of a website and a place to store it.');
    return(1);
}
var website = args[0];
var loc = args[1];
    
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
    await page.screenshot({path: loc + '.png', width: '1600px', height: height + 'px',  fullPage: false, displayHeaderFooter: true, printBackground: true});
    if (y) {
	await  page.click('button#closeCross.welc-close');
    }
    console.log('height is ' + height);
    
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
