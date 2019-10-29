Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEA9AE8D5F
	for <lists+linux-tegra@lfdr.de>; Tue, 29 Oct 2019 17:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390639AbfJ2Q6u (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 29 Oct 2019 12:58:50 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:41408 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfJ2Q6u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Oct 2019 12:58:50 -0400
Received: by mail-qt1-f182.google.com with SMTP id o3so21221412qtj.8
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2019 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=26c4q/O5tUL4qcI3Q6IUotRX6ZMyoS2A7wXwB9Byhtg=;
        b=sMJu6D5O5P+lCQ0ufFcyVMMCT9We/LbIY6dSA4aQ412F8oTKSeif6qV9M4O5psTMIS
         Bb0ZqJ3t9MdKV3/Qw/sMU7RRsDMesI5EadBjv5AgeJk9iVA6InqSpuf6tSWoHVdK3FAq
         3TPuOYbwUHcm54qyNdZbOYvtJzzQsS47QnVYRpfi+iDiqKVbO2v/VmGamPyW2nbDLJtp
         m0D2vRuDGYFcczlkBdIPmz+LHbWaPM0pmVOjpWSCIW9jZeD2mpEfnNoxDHy3lSnZemae
         hC151Wjb06i7xYOj4yVIwfcJnZE7jfpX9NBEZj7OV+NhOJT9+y1All3Kce0DK9Tdm30x
         ID7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=26c4q/O5tUL4qcI3Q6IUotRX6ZMyoS2A7wXwB9Byhtg=;
        b=alEl6qwrVKvDCyE7FcoV6uiRAov19CXlNVsFmylt1SirTxOMIH+BChuLgB/89Nx1Wv
         vUUY4tIK9jac+dmkUrAj/6LvcI6/wfjj3jFp9Qs2Ln1G5PxlYNyIoN51gsbtp7OuGx+K
         KxJQSeP4IKN79H+BMwsRoTPZOjIbnZbQJ3hXJVHrNq37eL9pn5SeHutYEuotZThHfjvM
         5b990BknhkjbUh9eEdIgoZceOkPif6p3DUc04MfTUevhyp1omOjSlajYeLutdHZeF/JX
         +JLV0jY31sjnsrd3/lKbQC4Cdf6YVJau5hK5qkPAVwv6oFw954os58pQiu9lTDPLga6J
         yqgw==
X-Gm-Message-State: APjAAAUGgUG5ksQfVo0sZDd6IHEZHWYx0ThMtedKrTmNWPmwH1oWXQ7S
        1/a17CRhEQjipunzml7iPZw41vwNxpPRQAwbraI=
X-Google-Smtp-Source: APXvYqyLdB7L3Pq/p+sFWqnWrnv6ofLgJc4YAKq2zq+bLnyE7edfItqlrgXTdroWBBYSsCw5USUioVp0tvbIHQFUk1I=
X-Received: by 2002:aed:3222:: with SMTP id y31mr5426288qtd.369.1572368327783;
 Tue, 29 Oct 2019 09:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+SHYrN7=oz64DTTNtRU6hv3=gM=WjO3Sn-32HMe5g2+A@mail.gmail.com>
 <21d7393e-6fba-d23e-3e0e-610503ea8fab@nvidia.com>
In-Reply-To: <21d7393e-6fba-d23e-3e0e-610503ea8fab@nvidia.com>
From:   =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date:   Tue, 29 Oct 2019 17:58:16 +0100
Message-ID: <CAFCWPPJY7dFU7uvaQOjwwvjbc8oG=GZ+R__w8xss=U85k5oCmw@mail.gmail.com>
Subject: Re: Kernel panic 5.4.0-rc1-next-20191004
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi.

p=C3=A1 11. 10. 2019 v 10:37 odes=C3=ADlatel Jon Hunter <jonathanh@nvidia.c=
om> napsal:
>
>
> On 10/10/2019 16:35, Milan Bu=C5=A1ka wrote:
> > Hello.
> >
> > Kernel compilation for testing on Jetson TX2 Developer Kit
> > resulted in a Kernel panic error.
> > I did the compilation while running the 5.4.0-rc1-next-20191004
> > kernel, which I had previously compiled on the NVIDIA kernel
> > I did the compilation directly on the device (without the cross compila=
tion)
>
> Any chance you could try to bisect this? I understand it is a bit of a
> pain because you need to run the compile every time, but if this is
> failing 100% with this version it would be good to see if it could be
> bisected.
>
> Cheers
> Jon
>
> --
> nvpublic

I turned off the Denver cores and lowered the frequency to 1920000 for
the A57 cores.
The kernel was compiled without errors.
I will still test different combinations of Denver and A57 at
different frequencies.

IMHO is a problem in insufficient CPU cooling.
The compilation took place with the fan off.
Jetson TX2 does not have fan support in the device tree.

But that is another chapter of the problem.

Thank you for your valuable advice.

Milan

--=20

Remember, no question is too stupid and no problem too small
                           -- We've all been beginners
