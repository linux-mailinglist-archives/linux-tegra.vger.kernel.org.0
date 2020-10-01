Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52DA627F7B8
	for <lists+linux-tegra@lfdr.de>; Thu,  1 Oct 2020 04:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgJACGZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 30 Sep 2020 22:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgJACGZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 22:06:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA73C061755;
        Wed, 30 Sep 2020 19:06:23 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u8so4598170lff.1;
        Wed, 30 Sep 2020 19:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YT6z6SMkQQE3bTl2QkyWGfDYfQH3pmpWjf60JPV3Yng=;
        b=ERo6xhYK/8Csp5aBw8ryB96uxnmJuPMEIptVZqUVjPHJLdD5mgjoUylCs9I5/gD3P7
         nngkKTH8LnORX29oJ1go1C/Gy8R3wF0Swxv7JCZjT8otGdRbGXIR6wdhsoXSmmgyfp9I
         K83cwe9730+1WJl13cRSU+TxZ0vR4+Qw407nAZrFpl3Y4xD9gQuBmtlztO4wbEvFrt+D
         4GUBk71dJTI3BEWFS9nFjfdIcz8KzeHo2+9NVY2Rd4pmmGJ1ZDZBVK6EE4oiWE8Z3uRI
         UtZeLgGlORqRi8N1ESMSy+Q6pF52Fpekxr+sS+uBsd6jyHkuxhHmavos/G/BxyDOzKoI
         VjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YT6z6SMkQQE3bTl2QkyWGfDYfQH3pmpWjf60JPV3Yng=;
        b=FBYzJ1THRA4aq5WEho6FVo8oYuFOmkIfI5Thock601rnijD6GBn2xanD5pJnOqa9cL
         Mb0r58GdAC6b/lI8BYz67IkDBOjS+SX4PrH+Pl9cFX46rchcsl2NTiRXe8MwkYBQZQPj
         22I9ZARE+MB1R6PFrUFU/nIQEc0E8dVqxHViOpz0jQnGn0lIILJI9fSTT3JmrL5f0N5T
         IQblg6zuRRMSImMtJwiK7q1fi3I5eseBl/Xsnf60nouSkQQ5CgHPi+IN34VJsEoyT0g3
         3CgjEwVBmlUnMfHcFx5LraL01zkT6+rRG3lR8xjljf6JkaWqKvFgKkIL4mX41ZFrHJwY
         Ld9A==
X-Gm-Message-State: AOAM531aOi5UefZBY6AmhC9Tq1z6qT4kSdmOeWDnMgUQhPqPsbkjs+L4
        X22O+hS5fhgbFWHhtmLSw8/mXjSUWjU=
X-Google-Smtp-Source: ABdhPJymiGq5V4Psj16FQr1wV5U8s+X6XJ2xhLtp3VlKEAi7EvPV2sW9z6UEKu1kSVjfn4/cBnKjDQ==
X-Received: by 2002:ac2:46fa:: with SMTP id q26mr1633365lfo.155.1601517981523;
        Wed, 30 Sep 2020 19:06:21 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id u2sm302304ljl.77.2020.09.30.19.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 19:06:20 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo> <20200930203618.GC2110@Asurada-Nvidia>
 <13746922-0253-cda7-e9ac-2bd20bf1a17f@gmail.com>
 <20200930213244.GA10573@Asurada-Nvidia>
 <5945a63e-79d8-e3ae-ab53-cee8c220ac7d@gmail.com>
 <20201001012630.GA28240@Asurada-Nvidia>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72b11925-5857-8ce5-d084-cab01ca1b396@gmail.com>
Date:   Thu, 1 Oct 2020 05:06:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001012630.GA28240@Asurada-Nvidia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2020 04:26, Nicolin Chen пишет:
> On Thu, Oct 01, 2020 at 12:56:46AM +0300, Dmitry Osipenko wrote:
>> 01.10.2020 00:32, Nicolin Chen пишет:
>>> On Thu, Oct 01, 2020 at 12:24:25AM +0300, Dmitry Osipenko wrote:
>>>> ...
>>>>>> It looks to me like the only reason why you need this new global API is
>>>>>> because PCI devices may not have a device tree node with a phandle to
>>>>>> the IOMMU. However, SMMU support for PCI will only be enabled if the
>>>>>> root complex has an iommus property, right? In that case, can't we
>>>>>> simply do something like this:
>>>>>>
>>>>>> 	if (dev_is_pci(dev))
>>>>>> 		np = find_host_bridge(dev)->of_node;
>>>>>> 	else
>>>>>> 		np = dev->of_node;
>>>>>>
>>>>>> ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
>>>>>> sure that exists.
>>>>>>
>>>>>> Once we have that we can still iterate over the iommus property and do
>>>>>> not need to rely on this global variable.
>>>>>
>>>>> I agree that it'd work. But I was hoping to simplify the code
>>>>> here if it's possible. Looks like we have an argument on this
>>>>> so I will choose to go with your suggestion above for now.
>>>>
>>>> This patch removed more lines than were added. If this will be opposite
>>>> for the Thierry's suggestion, then it's probably not a great suggestion.
>>>
>>> Sorry, I don't quite understand this comments. Would you please
>>> elaborate what's this "it" being "not a great suggestion"?
>>>
>>
>> I meant that you should try to implement Thierry's solution, but if the
>> end result will be worse than the current patch, then you shouldn't make
>> a v4, but get back to this discussion in order to choose the best option
>> and make everyone agree on it.
> 
> I see. Thanks for the reply. And here is a sample implementation:

That's what I supposed to happen :) The new variant adds code and
complexity, while old did the opposite. Hence the old variant is clearly
more attractive, IMO.
