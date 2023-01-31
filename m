Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF69B682D6D
	for <lists+linux-tegra@lfdr.de>; Tue, 31 Jan 2023 14:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjAaNKz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 31 Jan 2023 08:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjAaNKy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 08:10:54 -0500
Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com [115.124.28.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3BAD39;
        Tue, 31 Jan 2023 05:10:15 -0800 (PST)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436261|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.109619-0.000511876-0.889869;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=michael@allwinnertech.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.R66vAnW_1675170608;
Received: from 192.168.220.144(mailfrom:michael@allwinnertech.com fp:SMTPD_---.R66vAnW_1675170608)
          by smtp.aliyun-inc.com;
          Tue, 31 Jan 2023 21:10:10 +0800
Message-ID: <241c5b1d-de4a-5127-461f-8b885cca1668@allwinnertech.com>
Date:   Tue, 31 Jan 2023 21:10:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] mmc:mmc-cqhci:support interrupt coalescing
Content-Language: en-US
To:     Wenchao Chen <wenchao.chen666@gmail.com>
Cc:     adrian.hunter@intel.com, riteshh@codeaurora.org,
        asutoshd@codeaurora.org, ulf.hansson@linaro.org,
        chaotian.jing@mediatek.com, matthias.bgg@gmail.com,
        kdasu.kdev@gmail.com, alcooperx@gmail.com, f.fainelli@gmail.com,
        haibo.chen@nxp.com, shawnguo@kernel.org, agross@kernel.org,
        andersson@kernel.org, michal.simek@xilinx.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        bcm-kernel-feedback-list@broadcom.com, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, konrad.dybcio@linaro.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230130064656.106793-1-michael@allwinnertech.com>
 <CA+Da2qzJBxn5up1YLiaguhMJ=W7JkVExyyiFco9KyPE+3jEn8w@mail.gmail.com>
From:   Michael Wu <michael@allwinnertech.com>
In-Reply-To: <CA+Da2qzJBxn5up1YLiaguhMJ=W7JkVExyyiFco9KyPE+3jEn8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dear Wenchao，
   At present, I am working on the hook function .cqe_enable that the 
ICCTH of CQIC is set, and it work well in my test. Actually I want to 
confirm why the community does not support this feature. I think it is 
necessary to reduce the number of interrupts caused by IO and reducing 
interrupt context switching.

On 2023/1/31 11:09, Wenchao Chen wrote:
> On Mon, Jan 30, 2023 at 2:49 PM Michael Wu <michael@allwinnertech.com> wrote:
>>
>> Support interrupt coalescing to reduce the frequency of mmc interrupts
>>
> 
> Hi Michael
> The CQIS register does not have any configuration.
> Usually ICCTH needs to be enabled.
> 
>> Signed-off-by: Michael Wu <michael@allwinnertech.com>
>> ---
>>   drivers/mmc/host/cqhci-core.c      | 20 +++++++++++++++-----
>>   drivers/mmc/host/cqhci.h           |  5 ++++-
>>   drivers/mmc/host/mtk-sd.c          |  2 +-
>>   drivers/mmc/host/sdhci-brcmstb.c   |  2 +-
>>   drivers/mmc/host/sdhci-esdhc-imx.c |  2 +-
>>   drivers/mmc/host/sdhci-msm.c       |  2 +-
>>   drivers/mmc/host/sdhci-of-arasan.c |  2 +-
>>   drivers/mmc/host/sdhci-pci-core.c  |  2 +-
>>   drivers/mmc/host/sdhci-pci-gli.c   |  2 +-
>>   drivers/mmc/host/sdhci-tegra.c     |  2 +-
>>   drivers/mmc/host/sdhci_am654.c     |  2 +-
>>   11 files changed, 28 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
>> index b3d7d6d8d654..f9cdf9f04bfc 100644
>> --- a/drivers/mmc/host/cqhci-core.c
>> +++ b/drivers/mmc/host/cqhci-core.c
>> @@ -420,7 +420,7 @@ static void cqhci_disable(struct mmc_host *mmc)
>>   }
>>
>>   static void cqhci_prep_task_desc(struct mmc_request *mrq,
>> -                                struct cqhci_host *cq_host, int tag)
>> +                                struct cqhci_host *cq_host, int tag, int intr)
>>   {
>>          __le64 *task_desc = (__le64 __force *)get_desc(cq_host, tag);
>>          u32 req_flags = mrq->data->flags;
>> @@ -428,7 +428,7 @@ static void cqhci_prep_task_desc(struct mmc_request *mrq,
>>
>>          desc0 = CQHCI_VALID(1) |
>>                  CQHCI_END(1) |
>> -               CQHCI_INT(1) |
>> +               CQHCI_INT(intr) |
>>                  CQHCI_ACT(0x5) |
>>                  CQHCI_FORCED_PROG(!!(req_flags & MMC_DATA_FORCED_PRG)) |
>>                  CQHCI_DATA_TAG(!!(req_flags & MMC_DATA_DAT_TAG)) |
>> @@ -621,7 +621,7 @@ static int cqhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>>          }
>>
>>          if (mrq->data) {
>> -               cqhci_prep_task_desc(mrq, cq_host, tag);
>> +               cqhci_prep_task_desc(mrq, cq_host, tag, (cq_host->intr_clsc ? 0 : 1));
>>
>>                  err = cqhci_prep_tran_desc(mrq, cq_host, tag);
>>                  if (err) {
>> @@ -812,7 +812,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, unsigned int tag)
>>   irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>>                        int data_error)
>>   {
>> -       u32 status;
>> +       u32 status, rval;
>>          unsigned long tag = 0, comp_status;
>>          struct cqhci_host *cq_host = mmc->cqe_private;
>>
>> @@ -856,6 +856,15 @@ irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>>                  spin_unlock(&cq_host->lock);
>>          }
>>
>> +       if (cq_host->intr_clsc) {
>> +               rval = cqhci_readl(cq_host, CQHCI_IC);
>> +               rval |= CQHCI_IC_RESET;
>> +               cqhci_writel(cq_host, rval, CQHCI_IC);
>> +               rval = cqhci_readl(cq_host, CQHCI_IC);
>> +               rval &= (~CQHCI_IC_RESET);
>> +               cqhci_writel(cq_host, rval, CQHCI_IC);
>> +       }
>> +
>>          if (status & CQHCI_IS_TCL)
>>                  wake_up(&cq_host->wait_queue);
>>
>> @@ -1172,11 +1181,12 @@ static unsigned int cqhci_ver_minor(struct cqhci_host *cq_host)
>>   }
>>
>>   int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc,
>> -             bool dma64)
>> +             bool dma64, bool intr_clsc)
>>   {
>>          int err;
>>
>>          cq_host->dma64 = dma64;
>> +       cq_host->intr_clsc = intr_clsc;
>>          cq_host->mmc = mmc;
>>          cq_host->mmc->cqe_private = cq_host;
>>
>> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
>> index ba9387ed90eb..acf90773c30a 100644
>> --- a/drivers/mmc/host/cqhci.h
>> +++ b/drivers/mmc/host/cqhci.h
>> @@ -227,6 +227,9 @@ struct cqhci_host {
>>
>>          /* 64 bit DMA */
>>          bool dma64;
>> +
>> +       /* interrupt coalescing*/
>> +       bool intr_clsc;
>>          int num_slots;
>>          int qcnt;
>>
>> @@ -312,7 +315,7 @@ struct platform_device;
>>
>>   irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>>                        int data_error);
>> -int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
>> +int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64, bool intr_clsc);
>>   struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
>>   int cqhci_deactivate(struct mmc_host *mmc);
>>   static inline int cqhci_suspend(struct mmc_host *mmc)
>> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
>> index edade0e54a0c..2c18f954d4b8 100644
>> --- a/drivers/mmc/host/mtk-sd.c
>> +++ b/drivers/mmc/host/mtk-sd.c
>> @@ -2796,7 +2796,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
>>                  host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>>                  host->cq_host->mmio = host->base + 0x800;
>>                  host->cq_host->ops = &msdc_cmdq_ops;
>> -               ret = cqhci_init(host->cq_host, mmc, true);
>> +               ret = cqhci_init(host->cq_host, mmc, true, false);
>>                  if (ret)
>>                          goto host_free;
>>                  mmc->max_segs = 128;
>> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
>> index f2cf3d70db79..4aeaeddbbf25 100644
>> --- a/drivers/mmc/host/sdhci-brcmstb.c
>> +++ b/drivers/mmc/host/sdhci-brcmstb.c
>> @@ -231,7 +231,7 @@ static int sdhci_brcmstb_add_host(struct sdhci_host *host,
>>                  cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>>          }
>>
>> -       ret = cqhci_init(cq_host, host->mmc, dma64);
>> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>>          if (ret)
>>                  goto cleanup;
>>
>> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
>> index 9e73c34b6401..7aef7abe71f1 100644
>> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
>> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
>> @@ -1712,7 +1712,7 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
>>                  cq_host->mmio = host->ioaddr + ESDHC_CQHCI_ADDR_OFFSET;
>>                  cq_host->ops = &esdhc_cqhci_ops;
>>
>> -               err = cqhci_init(cq_host, host->mmc, false);
>> +               err = cqhci_init(cq_host, host->mmc, false, false);
>>                  if (err)
>>                          goto disable_ahb_clk;
>>          }
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4ac8651d0b29..b6549d1e43ec 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2153,7 +2153,7 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>          if (ret)
>>                  goto cleanup;
>>
>> -       ret = cqhci_init(cq_host, host->mmc, dma64);
>> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>>          if (ret) {
>>                  dev_err(&pdev->dev, "%s: CQE init: failed (%d)\n",
>>                                  mmc_hostname(host->mmc), ret);
>> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
>> index 89c431a34c43..811f8686532d 100644
>> --- a/drivers/mmc/host/sdhci-of-arasan.c
>> +++ b/drivers/mmc/host/sdhci-of-arasan.c
>> @@ -1610,7 +1610,7 @@ static int sdhci_arasan_add_host(struct sdhci_arasan_data *sdhci_arasan)
>>          if (dma64)
>>                  cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>>
>> -       ret = cqhci_init(cq_host, host->mmc, dma64);
>> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>>          if (ret)
>>                  goto cleanup;
>>
>> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
>> index c359f867df0a..6f6cae6355a7 100644
>> --- a/drivers/mmc/host/sdhci-pci-core.c
>> +++ b/drivers/mmc/host/sdhci-pci-core.c
>> @@ -964,7 +964,7 @@ static int glk_emmc_add_host(struct sdhci_pci_slot *slot)
>>          if (dma64)
>>                  cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>>
>> -       ret = cqhci_init(cq_host, host->mmc, dma64);
>> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>>          if (ret)
>>                  goto cleanup;
>>
>> diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
>> index 633a8ee8f8c5..6917ba339aa9 100644
>> --- a/drivers/mmc/host/sdhci-pci-gli.c
>> +++ b/drivers/mmc/host/sdhci-pci-gli.c
>> @@ -908,7 +908,7 @@ static int gl9763e_add_host(struct sdhci_pci_slot *slot)
>>          if (dma64)
>>                  cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>>
>> -       ret = cqhci_init(cq_host, host->mmc, dma64);
>> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>>          if (ret)
>>                  goto cleanup;
>>
>> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
>> index bff084f178c9..f98a468e8f43 100644
>> --- a/drivers/mmc/host/sdhci-tegra.c
>> +++ b/drivers/mmc/host/sdhci-tegra.c
>> @@ -1620,7 +1620,7 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
>>          if (dma64)
>>                  cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
>>
>> -       ret = cqhci_init(cq_host, host->mmc, dma64);
>> +       ret = cqhci_init(cq_host, host->mmc, dma64, false);
>>          if (ret)
>>                  goto cleanup;
>>
>> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
>> index 7ef828942df3..8e7fbee70e16 100644
>> --- a/drivers/mmc/host/sdhci_am654.c
>> +++ b/drivers/mmc/host/sdhci_am654.c
>> @@ -568,7 +568,7 @@ static int sdhci_am654_cqe_add_host(struct sdhci_host *host)
>>
>>          host->mmc->caps2 |= MMC_CAP2_CQE;
>>
>> -       return cqhci_init(cq_host, host->mmc, 1);
>> +       return cqhci_init(cq_host, host->mmc, 1, false);
>>   }
>>
>>   static int sdhci_am654_get_otap_delay(struct sdhci_host *host,
>> --
>> 2.29.0
>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Regards,
Michael Wu
