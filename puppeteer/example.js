const puppeteer = require('puppeteer');

function delay(time) {
    return new Promise(function(resolve) {
        setTimeout(resolve, time)
    });
}

(async () => {
    const browser = await puppeteer.launch({
        headless: false
    });
    const page = await browser.newPage();
    //await page.setViewport({width: 6000, height: 2000});
    await page.goto('http://localhost:8083',{ waitUntil: 'networkidle2' });
    //await page.screenshot({ path: '1-start.png' });
    console.log('Page loaded.. ')
    await delay(2000);
    console.log('Delay completed - page showed.')
    const popup =  await page.click('#nx-header-signin-1145-btnInnerEl')
    console.log('Clicked log in ')
    //await page.screenshot({ path: '2-after-login-click.png' });
    //await delay(2000);

    console.log("Popup: " + popup)


    console.log('Attempt to close browser...')
    await browser.close();
})();