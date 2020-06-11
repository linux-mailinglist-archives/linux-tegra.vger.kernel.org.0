Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189C41F6697
	for <lists+linux-tegra@lfdr.de>; Thu, 11 Jun 2020 13:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgFKL1t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 11 Jun 2020 07:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbgFKL1t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Jun 2020 07:27:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFA9C08C5C1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2020 04:27:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n23so6439540ljh.7
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2020 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6mOcf9ZGxPDgSVNgmAnnXwaYZSHaObyKh3HOSAxgHnE=;
        b=OSMwMV0xxxnYiWt/GmJIR6BTDA/fFzxhD9xcJ7S6k5gjCKaRkcHqny1h2aQXPlaSZN
         7S3QSS0WaYO1zNIvj9lCG4zO9UhmOtTdBY8vycTUOKcAvIcr5GExw1MusXua7m1rLG5y
         XYDePxsuM86TC2ZR/wZ811Sz9hy2wS7HD5lkGIujIXcJMjE8QT3KEheis9MFmmDNx6aL
         xxtfVKPZsr5ggc6+PBCBhJldMxA87BJp24u3C3DOnsV+Zg1f8PHXSV5dWJVmPzTB1em6
         wd0xylgdwvJvsAt6zztbAQRRG9SO/pIK7AOjSV1gMPsb8K7NtmfQqaGBPRdDNR6edkV3
         aM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6mOcf9ZGxPDgSVNgmAnnXwaYZSHaObyKh3HOSAxgHnE=;
        b=mbmI+zafc+47AkL97L2ZwLkIrDPMZRcJkbH+58r8iDhPAOXXtECoq2XBIAp3oNErt1
         HZENHLPMuF90HiYYurBt4ZwqkjDla7uJ6sGKX1qclJQeV3fyG60z2yPN8AllOAP1y9HZ
         /+AiWihZaJ5QUU5w1OT7lfxtrSiO0JCVvPOhr01LDANGakB+7TdsO0WUrOfuyzRjVFCG
         rrALqXTRBH8xxSEBRKBOXoEh5+ob6M2IaPhI1zEMEpDNRT4KjqQmVloxTlTD9x8jL7FV
         DtEaoJY9Hu54KurvjPqC8y3Jd880rYRqOALkbAptKHMLYM4DZ84+vZTDXG9EkJI2GzoS
         iWhQ==
X-Gm-Message-State: AOAM531/t6J7p4cdUTaP0cOKEfAsiH7j9iQteP3Y5QNP3F1WhUUZHBtr
        D7NEPPGlicEsRbkchGJ0yp0=
X-Google-Smtp-Source: ABdhPJxae9xtcIrlbVyBA7jQxQTe90UwgE4VJSSx0Fcf/X94sIB27L8KEIYpC44xzgP5sWlebhg+nA==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr4127615ljj.106.1591874867184;
        Thu, 11 Jun 2020 04:27:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id c20sm729143lfb.33.2020.06.11.04.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2020 04:27:46 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
To:     Daniel Stone <daniel@fooishbar.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
 <ca53d82f-1fd0-b2da-cfbf-7183a977e1d1@gmail.com>
 <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6e4dfca3-3f0f-0094-47eb-f267243ae7d1@gmail.com>
Date:   Thu, 11 Jun 2020 14:27:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rMcXQozYX90wGYbv_vNnQ0-fLLnEdH3Lzio+B1L7xZuYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

11.06.2020 11:17, Daniel Stone пишет:
> Hi Dmitry,
> 
> On Thu, 11 Jun 2020 at 08:54, Dmitry Osipenko <digetx@gmail.com> wrote:
>> 10.06.2020 14:30, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
>>> have a zpos property") a warning is emitted if there's a mix of planes
>>> with and without a zpos property.
>>
>> What problem does it solve?
> 
> Well, it fixes the WARN_ON, which asserts that either no planes have
> the zpos property attached, or all planes have the zpos property
> attached. When only _some_ planes have the property, the property is
> pretty much useless: zpos exists to guarantee to userspace the
> relative ordering between planes, defined by the value of the
> property. If not all planes have the property, then userspace cannot
> reason about the ordering, since some of the planes have undefined
> ordering.

Hello Daniel,

So it's a kernel warning, thank you for the clarification! I'm running
only older Tegras that have a black-n-white cursor plane, but this is
not supported by the upstream kernel. No wonder that I haven't seen the
warning, this made me curious what this patch is about :)
