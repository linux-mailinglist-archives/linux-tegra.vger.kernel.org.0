Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510D0C8E74
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 18:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfJBQeJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 12:34:09 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36964 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfJBQeJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 12:34:09 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so17836281lje.4
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 09:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QzSTJow8oMcZhowrs8RzzW947+x0J4wR10y7RPJeLgk=;
        b=tVK8dnzSHHz+RDj3zzBo4PRVTuiYBgPnhEO740JILqTvzHecoMdGVLbJ4oZL8roXPX
         0eAnJzLqp+UjFlBqpmnchctAcTD+dmT8ByYkHTCbmIt4SfwKmBxx5zN7+wYIJxnj1KQN
         TiJ9amOzVFZQtezW9up1kGR9QB0Zaa/Lnb1EwcUiVYfx8pHMB/xqYTADhXIIdAFSTkEv
         edhmyeEvMH88bjlsoCJcxGbSIOasw6p07CyeX22FG9CqjhKJrzMIEeD6VZqNUaUXtBO4
         488uUB+KZ1LkZei7Wq22SulSv+aRAE1dRNbn4RgiNuDqe6e+SianmgOmw6p+16v+Zexd
         06Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QzSTJow8oMcZhowrs8RzzW947+x0J4wR10y7RPJeLgk=;
        b=TZ6g4YMMrjswTz4fG8Qt9LlOkikFT0NrHJhu3FWYYZ4aGiQsJeBkg26hePsebrjELw
         LboG8w1e647Dbz/kKkehfVU+TVIVheQ5sWC/rQqqJ0ftdKx2h9QvbdzKLBZD4NNIquyv
         1sSxjregSnbjvejYwaNR77S1WPD6DumozWN2SAhBhHS/Btaz7IC8dns1OBfMQTIUaE2u
         sSxkJ3t2zI5FneQSTXjcj8UeFh13PAnYS85DhaLT4eg9UR16g/0uaCdYHHXFkNMbMEjs
         G/yIV3EgKQoPCRhEn3t9WKVrHS8x1cZEvMzVJgTH6qx+q7FA2VI2fss6a5uVMzUg+gq7
         oGmw==
X-Gm-Message-State: APjAAAW8Kwr6Ua2b7pFGUfN9viI3XK/1tloFLhi8aMeT5LtQnPBMboQC
        pEwcaAVK12l2tORPGdImnFaWltOV
X-Google-Smtp-Source: APXvYqzR9j401TQO4mxZaANnjeP+8Kc+91lzqBFq2tlQpYsQhhcc5VIwdS8aIyAYrgPHTG/eHbFqfA==
X-Received: by 2002:a2e:2e13:: with SMTP id u19mr3125578lju.112.1570034047123;
        Wed, 02 Oct 2019 09:34:07 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.231])
        by smtp.googlemail.com with ESMTPSA id c15sm835454lja.99.2019.10.02.09.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2019 09:34:06 -0700 (PDT)
Subject: Re: [PATCH 4/5] usb: chipidea: tegra: add the tegra specific bits
To:     Peter Geis <pgwipeout@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
References: <20191002014153.29831-1-pgwipeout@gmail.com>
 <20191002014153.29831-5-pgwipeout@gmail.com> <20191002112631.GN3716706@ulmo>
 <CAMdYzYpXdVPXSJ7w5eRhOkgmg_cfyj+Yr_agbimn__zfMBsDCw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d044c06c-4e63-26f1-195f-88213b099b47@gmail.com>
Date:   Wed, 2 Oct 2019 19:34:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYpXdVPXSJ7w5eRhOkgmg_cfyj+Yr_agbimn__zfMBsDCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.10.2019 15:07, Peter Geis пишет:
> On Wed, Oct 2, 2019 at 7:26 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> On Tue, Oct 01, 2019 at 09:41:52PM -0400, Peter Geis wrote:
>>> As Tegra requires special handlers for resets and dma alignment, add
>>> those functions to a header.
>>>
>>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>>> ---
>>>  drivers/usb/chipidea/tegra.h | 159 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 159 insertions(+)
>>>  create mode 100644 drivers/usb/chipidea/tegra.h
>>
>> Can't you move these into the ci_hdrc_tegra.c file? It's kind of odd to
>> have large functions like this implemented in a header.
>>
>> Thierry
> 
> I put this into a header since the chipidea host driver uses it
> exclusively and it doesn't export most of its functions.
> The other ways involved significant changes to the host driver or
> duplicating a lot of functionality in the tegra-udc driver.
> Neither method seemed good to me, and I couldn't figure out a better
> way to do it.
> 

Looks like you could add hooks for [un]map_urb_for_dma() and port_reset() to the
ci_hdrc_platform_data.

Then it could be:

...
ci_ehci_hc_driver.map_urb_for_dma = ci->platdata->map_urb_for_dma;
ci_ehci_hc_driver.unmap_urb_for_dma = ci->platdata->unmap_urb_for_dma;
...
if (ci->platdata->port_reset &&
    typeReq == SetPortFeature && wValue == USB_PORT_FEAT_RESET) {
	spin_unlock_irqrestore(&ehci->lock, flags);
	return ci->platdata->port_reset(ehci, status_reg);
}

and in tegra_udc_probe():

/* setup and register ChipIdea HDRC device */
...
udc->data.map_urb_for_dma = tegra_map_urb_for_dma;
udc->data.unmap_urb_for_dma = tegra_unmap_urb_for_dma;
udc->data.port_reset = tegra_ehci_internal_port_reset;
