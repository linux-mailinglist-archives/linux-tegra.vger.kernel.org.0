Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCE944A775
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 18:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbfFRQrh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 12:47:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36037 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729472AbfFRQrg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 12:47:36 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so265993ljj.3;
        Tue, 18 Jun 2019 09:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yd1CiSx++Vd6Axlap0G/Soq/17Kgren6gseW0F9xi/4=;
        b=NGhr+8kzF4aqtheZ0TkbLt31P0rq8O4BJl4FGtnMw+Yz8QRc7QjYdLue7o9XJtMuS0
         TZRwp2VTht2dIF6ZAbAQBaiE/Wu8zl/yoCtV1/rTZJkZcTdzx6eJ/zZEeWNdmjiomhI3
         GCRJEWz+HmcXGeIzBq4ex3um+fg0pQujhhZjUclQSS4q4VZUeZ0zvCB/C2GOjhRUi4wF
         hlgSAAFJgbK6Yp4cH1h5BBa4rLlRM3m/p62AQaF1n2KKq+3qdnEzuq9BWNLzmFtOPulQ
         TWKjGWbp0krNX6+TcIQV7txRxTzbEw6TgXEeppyolRe1NtpM6R6u8oYK+NfxLltpBmp6
         5caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yd1CiSx++Vd6Axlap0G/Soq/17Kgren6gseW0F9xi/4=;
        b=FpjKu/p8MXgSobCiDqyFTqC2xuGj1xRhipZCOTHVSbyytcUrNnrlvuXycUWhhJvWLa
         T1z/P4/mlAR9Sqz+4+ee83F34vo0eW2iGN9/I7FekKsdH88audTOq8FGuYMRH2Jv4UBI
         WoJkWmYY3yff627ttmsY5F53+EMFU+w2Porm5mQsnpECsu9ayInsKhBhBq2pkkhLhAJ3
         GfZbrK/j/ZZ558f6UtKSWgYxHlDTtLlKrxX+K6YvdzuqOkdOh+9ExfEu5LrHWIlkoEt9
         Noxnix8Gf9FAnONJ4ks4jvJCI4T2+pw5XrcqLrIvE5qR1w7PqlXJgT/+gB60G5MLPaHO
         bBFA==
X-Gm-Message-State: APjAAAXyYCWgjk9sXWuJb3uRfswjNWj0SZqMTeY9JErewdzA/kd5s4/A
        3XfK/JqTI2ZYuboij2KdxBVtjIvz
X-Google-Smtp-Source: APXvYqz4yoRlfE5HwYZyRfn/RdX4kvEJetPDaWO8tBQ1yBws6qrbt8LDphZzgq+hiXDge97qVIzKRA==
X-Received: by 2002:a2e:82c5:: with SMTP id n5mr24711273ljh.175.1560876454191;
        Tue, 18 Jun 2019 09:47:34 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id h22sm2684400ljj.105.2019.06.18.09.47.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:47:33 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] regulator: core: Don't attach generic coupler to
 Tegra SoC regulators
To:     Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-7-digetx@gmail.com>
 <20190617154455.GA5316@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a4ccd5af-ce71-bc24-cdb9-d480380d15d4@gmail.com>
Date:   Tue, 18 Jun 2019 19:47:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617154455.GA5316@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.06.2019 18:44, Mark Brown пишет:
> On Tue, Jun 04, 2019 at 02:59:02AM +0300, Dmitry Osipenko wrote:
> 
>>  static int generic_coupler_attach(struct regulator_coupler *coupler,
>>  				  struct regulator_dev *rdev)
>>  {
>> +	/*
>> +	 * Generic coupler isn't suitable for NVIVIA Tegra SoC's, at least
>> +	 * for now. Hence filter out the unwanted regulators as they shall be
>> +	 * managed by a platform-specific coupler.
>> +	 */
>> +	if (of_property_read_bool(rdev->dev.of_node, "tegra-core-regulator") ||
>> +	    of_property_read_bool(rdev->dev.of_node, "tegra-rtc-regulator") ||
>> +	    of_property_read_bool(rdev->dev.of_node, "tegra-cpu-regulator"))
>> +		return -EPERM;
>> +
> 
> I'm having a hard time loving this as it requires explicit DT changes
> for implementation.  I'm thinking that since the couplers are going to
> need to be built in it'd be better to make sure that any custom ones get
> registered first and then only bind the generic coupler to anything they
> reject.
> 

Actually, the current implementation at first tries all the custom couplers and then
falls back to the generic.

What's currently missing is that any error code of the attach_regulator() callback is
treated as "go try next coupler", but we probably need a special error code for the
"skip me" case to differentiate from a error that should abort the coupler's lookup
process.

I'll re-work this in v3.
