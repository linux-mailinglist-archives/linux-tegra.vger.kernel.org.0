Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6116F192A41
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2020 14:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgCYNkL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 Mar 2020 09:40:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36963 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgCYNkK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Mar 2020 09:40:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id w10so3147551wrm.4
        for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2020 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9Tmx/q/z1h228maidx+B+W5v7B2DB3ULOBj1YoNCmLQ=;
        b=ZfvdjM/QWPkvRF4aZhOMcGD8uAaEa3a9z57/KDQQUDHSC5P6ju2LOZ5Jrvope2JRFg
         0t4jUSopz0kgg8yni93HOKWxANCNEhS+wzzpLW31vWacTB2yGwp9K4aYnZuR6ql8kwqM
         PJN/YYBp6zqIXe8QtdYJSA3SBRofZafeVTnocx4ShsyzD/UtfGeLIFFJSOwEZ+FrpOYX
         /F1QLqE+LzxAhvecrCZh7vTtvNpzam/ERoF39ewr5jl0S0W2N2IaT7ohXE0l18Cuerf0
         mzwgDsVO3s5tZrhb7QHR4apjCaECxh/LYTdT89JLtWulr6uDVoi2Ef8jnZaHvasErlCJ
         uJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=9Tmx/q/z1h228maidx+B+W5v7B2DB3ULOBj1YoNCmLQ=;
        b=UOC711se4kVyQejgX9EpuL2RpEcCnJBpIkRwZ6hQgeNKJ+zr1lpIgBmgwxOhlXOEPc
         MoECuy69GPdMRi/7YjZQnwNulmOSpmgNY13K4L4qGybBCD0tkwYdZZhBoyt+hyQa2F6P
         Yq7uIzCBZbSpcf+T/CJe9q36rh8zEk+SuqmSMFxsjLsvGtNs5gut6Mzl59nDAFGTG3Y5
         B3dSkEhzqQuYoa7hkNAXAQjhgD8G0DZKvhIq6rCwUk7TYFlcmCeXGf/SIo2FaE6N+wlN
         nSn5/kQGS7nPcmWiJPR3rBkj3KmCtyS1cQqVVP90ezMR50hRxPAj4dgFu1nOBfXVdWEp
         GFIQ==
X-Gm-Message-State: ANhLgQ2mmjmcfSL4ihhzkKwiDmOP0R7vWOrFBns51d514dEy+DJWC7Rt
        MylXA+egENI0QhXEmLheRLr0fA==
X-Google-Smtp-Source: ADFU+vvUFo5VyLEdXlLvP4jxG7ZFn8D4rnGgV0PvYjNl6zV+qg4FIS+krg5jIfgSc0QpMaFDiUqtFw==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr3397860wrw.133.1585143606663;
        Wed, 25 Mar 2020 06:40:06 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id b11sm22503149wrq.26.2020.03.25.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 06:40:05 -0700 (PDT)
Date:   Wed, 25 Mar 2020 14:40:03 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Nicolas Chauvet <kwizart@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        pdeschrijver@nvidia.com,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        axboe@kernel.dk, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-ide@vger.kernel.org
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Message-ID: <20200325134003.GA27961@Red>
References: <20200319074401.GA4116@Red>
 <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABr+WTnBmJsDZPjUxYkG98dTneDD1p8G=uRftVduTGYbY0ruqQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 08:55:38AM +0100, Nicolas Chauvet wrote:
> Le jeu. 19 mars 2020 � 08:44, LABBE Corentin <clabbe@baylibre.com> a �crit :
> >
> > Hello
> >
> > sata doesnt work on tegra124-jetson-tk1 on next and master and at least since 5.2 (but 5.1 works).
> > [    0.492810] +5V_SATA: supplied by +5V_SYS
> > [    0.493230] +12V_SATA: supplied by +VDD_MUX
> > [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> > [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> > [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> > [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> > [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci not found, using dummy regulator
> > [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy not found, using dummy regulator
> > [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target not found, using dummy regulator
> > [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> > [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
> > [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> > [   35.694269] +5V_SATA: disabling
> > [   35.697438] +12V_SATA: disabling
> 
> It looks strange, because (on same device) , I have sata working as
> appropriate, but ethernet fails with me.
> https://bugzilla.kernel.org/show_bug.cgi?id=206217
> 
> It might worth to have another report.
> 

Hello

Mine has ethernet works well. But I hit many problem with it and older kernel.
Perhaps the 5.1.21, were I am stuck, does not have it.

Anyway, the tegra of kerneci has the same SATA problem.
https://storage.kernelci.org/next/master/next-20200325/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-baylibre/boot-tegra124-jetson-tk1.txt

Maintainers, any idea on this sata issue ?

Regards
