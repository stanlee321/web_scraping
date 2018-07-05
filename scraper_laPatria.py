from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from multiprocessing import Pool, cpu_count
from multiprocessing import Queue, Process

import os
dcap = dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"] = (
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/53 "
    "(KHTML, like Gecko) Chrome/15.0.87"
)

class PageBot(webdriver.PhantomJS):
    """Main class for browsing facebook"""

    def __init__(self):
        # pathToPhantomJs ="
        """relativePhatomJs = "\\phantomjs.exe"
        service_args = None
        if images == False:
            service_args = ['--load-images=no', ]
        if pathToPhantomJs == None:
            path = self, os.getcwd() + relativePhatomJs
        else:
            path = pathToPhantomJs
            webdriver.PhantomJS.__init__(self, path, service_args=service_args)
        """
        webdriver.PhantomJS.__init__(self, desired_capabilities=dcap)
        # webdriver.Firefox.__init__(self)

        self.avisos_eco_path = ["/html/body/div[2]/div[10]/div[2]/div/div[9]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[8]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[10]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[11]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[7]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[6]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[5]/a",
                                "/html/body/div[2]/div[10]/div[2]/div/div[4]/a"
                                ]

        self.avisos_eco_path_true = ''

        self.pato_escondido ="/html/body/div[2]/div[10]/div[3]"

    def get(self, url):
        """The make the driver go to the url but reformat the url if is for facebook page"""
        super().get(url)
        # self.save_screenshot("Debug.png")

    def leer_articulos(self):
        _button_class = "botoncito_resumenes"
        _article_id = "seleccion"
        _article_class = "nota_resumen"
        _date_divition = "/html/body/div[2]/div[14]/table/tbody/tr/td[1]/div[1]/div/strong"
        #self.get(url)
        date_information = self.find_element_by_xpath(_date_divition)
        grav_date = str(date_information.text).replace(' ', '_').replace(':', '').replace(',', '')

        if os.path.isdir('data/' + grav_date):
            print('Path already exist')
            print('WORK was done here')
        else:
            os.makedirs('data/' + grav_date)
            # Loop over every article
            for i in range(len(self.find_elements_by_class_name(_button_class))):
                # Load article page
                self.find_elements_by_class_name(_button_class)[i].click()
                # Find for Article body
                article_box = self.find_element_by_id(_article_id)
                article = article_box.find_element_by_class_name(_article_class)

                avisos_text = (article.text)

                file_name = avisos_text[:30].splitlines()[0].replace(' ', '_')
                with open('data/{}/{}.csv'.format(grav_date, file_name), 'wb') as f:
                    f.write(avisos_text.encode('utf-8') + '\n'.encode('utf-8'))
                self.back()

    def generate_date(self):
        years = ["{0:04}".format(i) for i  in range(2010, 2016)]
        months = ["{0:02}".format(i) for i in range(1, 13)]
        days = ["{0:02}".format(i) for i in range(1, 31)]
        return years, months, days

    def create_dates(self):
        all_dates = []
        y, m, d = self.generate_date()
        for year in y:
            for month in m:
                for day in d:
                    base_url = "http://lapatriaenlinea.com/?fecha={}-{}-{}".format(year, month, day)
                    all_dates.append(base_url)
        return all_dates

    def feed_date(self, base_url):
        print('BASE URL to feed', base_url)
        try:
            self.get(base_url)
            self.find_element_by_xpath(self.pato_escondido).click()
            for possible in self.avisos_eco_path:
                try:
                    possible_aviso = self.find_element_by_xpath(possible)
                    if 'Avisos Econ' in possible_aviso.text:
                        self.avisos_eco_path_true = possible
                        break
                    else:
                        pass
                except Exception as e:
                    pass
            else:
                pass
            print('TRUE PATH', self.avisos_eco_path_true )
            self.find_element_by_xpath(self.avisos_eco_path_true).click()
            self.leer_articulos()
        except Exception as e:
            print('EXCPETION IS ', e)
            with open('debug/debug.txt', 'a') as f:
                f.write('\n' + base_url)
            self.save_screenshot("debug/debug_{}.png".format(base_url.split('=')[-1]))


def create_batches(datalist):
    # max number of parallel process
    ITERATION_COUNT = cpu_count()-1

    count_per_iteration = len(datalist) / float(ITERATION_COUNT)

    batchs = []
    for i in range(0, ITERATION_COUNT):
        list_start = int(count_per_iteration * i)
        list_end = int(count_per_iteration * (i+1))
        batchs.append(datalist[list_start:list_end])
    return batchs


def run_process(url):
    driver = PageBot()
    driver.feed_date(url)


def main():
    driver = PageBot()
    all_links = driver.create_dates()
    batches = create_batches(all_links)
    with Pool(cpu_count() - 1) as p:
        for batch in batches:
            p.map(run_process, batch)
            p.close()
            p.join()

if __name__ == '__main__':

    main()
    print('WORK DONE')